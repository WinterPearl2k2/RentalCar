import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiengviet/tiengviet.dart';

import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:image/image.dart' as img;
import '../verify_id_state/verify_id_state.dart';

part 'verify_id_notifier.g.dart';

@riverpod
class VerifyIdNotifier extends _$VerifyIdNotifier {
  @override
  VerifyIdState build() => const VerifyIdState();

  void changeStateView(VerifyStateView stateView) {
    state = state.copyWith(stateView: stateView);
  }

  Future<void> handleVerifyFace(CameraController controller) async {
    final XFile xFile = await controller.takePicture();
    final file = File(xFile.path);
    InputImage inputImage = InputImage.fromFile(file);
    final output = await _handleDataFace(inputImage, file);
    final isValid = await _compareDataFace(output, state.dataFaceIdCard);
    LogUtils.i('valid $isValid');
  }

  void openCamera({
    required context,
    required TypeCard type,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CameraCamera(
          resolutionPreset: ResolutionPreset.max,
          cameraSide: CameraSide.front,
          enableZoom: true,
          onFile: (file) async {
            Navigator.pop(context);
            switch (type) {
              case TypeCard.frontCard:
                await _handleDataImage(file);
              case TypeCard.backCard:
                _saveBackCardImage(file);
            }
          },
        ),
      ),
    );
  }

  Future<void> openGallery(TypeCard type) async {
    PermissionStatus permission = await Permission.camera.request();
    if (permission.isGranted) {
      final pickedFile = await ImagePicker()
          .pickImage(source: ImageSource.gallery)
          .onError((error, stackTrace) {
        return null;
      });
      final file = File(pickedFile?.path ?? "");
      switch (type) {
        case TypeCard.frontCard:
          await _handleDataImage(file);
        case TypeCard.backCard:
          _saveBackCardImage(file);
      }
    } else if (permission.isDenied) {
      Fluttertoast.showToast(msg: "Gallery access has not been granted");
    }
  }

  void _saveBackCardImage(File file) {
    state = state.copyWith(imgFileBack: file.path);
  }

  Future<void> _handleDataImage(File file) async {
    InputImage inputImage = InputImage.fromFile(file);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String text = recognizedText.text;
    Map<String, String> extractedInfo = extractInfo(text);
    LogUtils.i(extractedInfo.toString());
    if (extractedInfo.length != 5) {
      Fluttertoast.showToast(
        msg:
            'The provided image is blurred or unclear, please provide the information again.',
      );
      return;
    }
    final output = await _handleDataFace(inputImage, file);
    if (output.isEmpty) return;
    state = state.copyWith(
      imgFileFront: file.path,
      dataFaceIdCard: output,
    );
  }

  Future<List<dynamic>> _handleDataFace(
    InputImage inputImage,
    File file,
  ) async {
    final options = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: options);
    final faces = await faceDetector.processImage(inputImage);
    final bytes = file.readAsBytesSync();
    final image = img.decodeImage(Uint8List.fromList(bytes));
    if (faces.isEmpty) {
      Fluttertoast.showToast(
        msg:
            'The ID card has an unclear face, please provide the information again.',
      );
      return [];
    }
    int x = faces[0].boundingBox.left.toInt();
    int y = faces[0].boundingBox.top.toInt();
    int w = faces[0].boundingBox.width.toInt();
    int h = faces[0].boundingBox.height.toInt();
    img.Image imgFace = img.copyCrop(
      image!,
      x: x,
      y: y,
      width: w,
      height: h,
    );
    imgFace = img.copyResizeCropSquare(
      imgFace,
      size: 112,
    );

    List input = imageToByteListFloat32(
      imgFace,
      112,
      128,
      128,
    );

    input = input.reshape([
      1,
      112,
      112,
      3,
    ]);
    final imgU8List = Uint8List.fromList(img.encodeJpg(imgFace));
    final imageEncoded = base64.encode(imgU8List);
    List<int> list = imgU8List.toList();
    state = state.copyWith(test: list);
    LogUtils.i(imageEncoded);
    debugPrint(imageEncoded);
    List output = List.filled(1 * 192, null, growable: false).reshape(
      [1, 192],
    );
    final interpreter = await tfl.Interpreter.fromAsset(
      'assets/tflite/mobilefacenet.tflite',
    );
    interpreter.run(input, output);
    output = output.reshape([192]);
    return output;
  }

  Float32List imageToByteListFloat32(
    img.Image imgFace,
    int inputSize,
    int mean,
    int std,
  ) {
    // Cấp phát một đối tượng Float32List mới để lưu trữ các giá trị pixel đã chuyển đổi.
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    // Đối tượng Float32List dưới dạng một bộ đệm
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    // Lặp qua các pixel của ảnh đầu vào.
    for (var x = 0; x < inputSize; x++) {
      for (var y = 0; y < inputSize; y++) {
        var pixel = imgFace.getPixel(y, x);
        buffer[pixelIndex++] = (pixel.r - mean) / std;
        buffer[pixelIndex++] = (pixel.g - mean) / std;
        buffer[pixelIndex++] = (pixel.b - mean) / std;
      }
    }
    return convertedBytes.buffer.asFloat32List();
  }

  Map<String, String> extractInfo(String text) {
    final Map<String, String> info = {};

    final noRegExp = RegExp(r'(?:No|Na)\.?:?\s*([0-9]+)');
    final nameRegExp =
        RegExp(r'Full name:\s*([A-ZÀ-Ỹ ]+)', caseSensitive: false);
    final dobRegExp =
        RegExp(r'Date of birth:\s*([\d/]+)', caseSensitive: false);
    final sexRegExp = RegExp(r'Sex:\s*(\S+)', caseSensitive: false);
    final nationalityRegExp =
        RegExp(r'Nationality:\s*([^\n]+)', caseSensitive: false);
    final originRegExp =
        RegExp(r'Place of origin:\s*([^\n]+)', caseSensitive: false);

    final noMatch = noRegExp.firstMatch(text);
    final nameMatch = nameRegExp.firstMatch(text);
    final dobMatch = dobRegExp.firstMatch(text);
    final sexMatch = sexRegExp.firstMatch(text);
    final nationalityMatch = nationalityRegExp.firstMatch(text);
    final originMatch = originRegExp.firstMatch(text);

    if (noMatch != null) {
      info['No'] = noMatch.group(1)!;
    }
    if (nameMatch != null) {
      info['Full name'] = TiengViet.parse(
        nameMatch.group(1)!.trim().toUpperCase(),
      );
    }
    if (dobMatch != null) {
      info['Date of birth'] = dobMatch.group(1)!;
    }
    if (sexMatch != null) {
      info['Sex'] = TiengViet.parse(
        sexMatch.group(1)!.toUpperCase(),
      );
    }
    if (nationalityMatch != null) {
      info['Nationality'] = TiengViet.parse(
        nationalityMatch.group(1)!.toUpperCase(),
      );
    }
    if (originMatch != null) {
      info['Place of origin'] = TiengViet.parse(
        originMatch.group(1)!.trim().toUpperCase(),
      );
    }

    return info;
  }

  Future<bool> _compareDataFace(
    List<dynamic> output,
    List<dynamic> dataFaceIdCard,
  ) async {
    const minDist = 999;
    double currDist = 0.0;
    double sum = 0;
    final dataFace = List.from(output);
    final dataFaceId = List.from(dataFaceIdCard);
    LogUtils.w('dataface$dataFace');
    LogUtils.w('datafaceId$dataFaceId');
    for (int i = 0; i < output.length; i++) {
      sum += pow((dataFaceId[i] - dataFace[i]), 2);
    }
    currDist = sqrt(sum);
    LogUtils.e('currDist: $currDist');
    if (currDist <= 0.7 && currDist < minDist) {
      return true;
    }
    return false;
  }
}
