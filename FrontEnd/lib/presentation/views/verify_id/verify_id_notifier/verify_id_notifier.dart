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
import 'package:rental_car/application/services/auth_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/data_sources/remote/dio/api_exception.dart';
import 'package:rental_car/data/dtos/citizen_dto.dart';
import 'package:rental_car/domain/model/citizen.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/views/verify_id/widgets/camera_widget.dart';
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

  Future<void> initCamera(
    CameraController controller,
    bool mounted,
  ) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    state = state.copyWith(wait: true);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      state = state.copyWith(wait: false);
    });
  }

  Future<void> updateInformation(context) async {
    state = state.copyWith(wait: true);
    try {
      final citizenDto = CitizenDto(
        no: state.citizen.no,
        dateOfBirth: state.citizen.dateOfBirth,
        fullName: state.citizen.fullName,
        nationality: state.citizen.nationality,
        placeOfOrigin: state.citizen.placeOfOrigin,
        sex: state.citizen.sex,
      );
      await injection
          .getIt<IAuthService>()
          .updateInformation(citizen: citizenDto);
      PreferenceService.setAuth(true);
      Navigator.pop(context, true);
      Fluttertoast.showToast(msg: 'Information updated successfully.');
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(wait: false);
  }

  Future<void> checkExistId() async {
    state = state.copyWith(wait: true);
    try {
      await injection.getIt<IAuthService>().checkValidResume(
            no: state.citizen.no,
          );
      state = state.copyWith(
        stateView: VerifyStateView.verifyFace,
      );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(wait: false);
  }

  Future<void> handleVerifyFace(CameraController controller) async {
    final XFile xFile = await controller.takePicture();
    final file = File(xFile.path);
    InputImage inputImage = InputImage.fromFile(file);
    final output = await _handleDataFace(inputImage, file);
    final isValid = await _compareDataFace(output, state.dataFaceIdCard);
    if (!isValid) {
      Fluttertoast.showToast(
        msg:
            'The facial information does not match the information on the ID card, please verify again.',
      );
      return;
    }
    state = state.copyWith(
      stateView: VerifyStateView.verifySuccess,
    );
  }

  void openCamera({
    required context,
    required TypeCard type,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CameraWidget(
          type: type,
          cardImage: (file)=> _saveBackCardImage(file),
          dataImage: (file)=> _handleDataImage(file),
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
          break;
        case TypeCard.backCard:
          _saveBackCardImage(file);
          break;
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
    if (extractedInfo.length != 6) {
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
      citizen: Citizen.fromJson(extractedInfo),
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
    final imgU8List = Uint8List.fromList(
      img.encodeJpg(imgFace),
    );
    final faceMemory = imgU8List.toList();
    state = state.copyWith(faceMemory: faceMemory);
    List output = List.filled(
      1 * 192,
      null,
      growable: false,
    ).reshape(
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
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
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
      info['no'] = noMatch.group(1)!;
    }
    if (nameMatch != null) {
      info['fullName'] = TiengViet.parse(
        nameMatch.group(1)!.trim().toUpperCase(),
      );
    }
    if (dobMatch != null) {
      info['dateOfBirth'] = dobMatch.group(1)!;
    }
    if (sexMatch != null) {
      info['sex'] = TiengViet.parse(
        sexMatch.group(1)!.toUpperCase(),
      );
    }
    if (nationalityMatch != null) {
      info['nationality'] = TiengViet.parse(
        nationalityMatch.group(1)!.toUpperCase(),
      );
    }
    if (originMatch != null) {
      info['placeOfOrigin'] = TiengViet.parse(
        originMatch.group(1)!.trim().toUpperCase(),
      );
    }

    return info;
  }

  Future<bool> _compareDataFace(
    List<dynamic> output,
    List<dynamic> dataFaceIdCard,
  ) async {
    // const minDist = 999;
    // double currDist = 0.0;
    // double sum = 0;
    // final dataFace = List.from(output);
    // final dataFaceId = List.from(dataFaceIdCard);
    // LogUtils.w('dataface$dataFace');
    // LogUtils.w('datafaceId$dataFaceId');
    // for (int i = 0; i < output.length; i++) {
    //   sum += pow((dataFaceId[i] - dataFace[i]), 2);
    // }
    //   currDist = sqrt(sum);
    // LogUtils.e('currDist: $currDist');
    // if (currDist <= 0.7) {
    //   return true;
    // }
    double sum = 0;
    final dataFace = List.from(output);
    final dataFaceId = List.from(dataFaceIdCard);
    for (int i = 0; i < output.length; i++) {
      sum += pow((dataFaceId[i] - dataFace[i]), 2);
    }
    double same = 0.0;
    for (int i = 0; i < 400; i++) {
      final threshold = 0.01 * (i + 1);
      if (sum < threshold) {
        same += 1.0 / 400;
      }
    }
    // final currDist = cosineSimilarity(output, dataFaceIdCard);
    if (same >= 0.75) {
      return true;
    }
    return false;
  }

  double cosineSimilarity(List<dynamic> vectorA, List<dynamic> vectorB) {
    double dotProduct = 0;
    double magnitudeA = 0;
    double magnitudeB = 0;

    for (int i = 0; i < vectorA.length; i++) {
      dotProduct += vectorA[i] * vectorB[i];
      magnitudeA += vectorA[i] * vectorA[i];
      magnitudeB += vectorB[i] * vectorB[i];
    }

    if (magnitudeA == 0 || magnitudeB == 0) {
      return 0.0;
    }

    return dotProduct / (sqrt(magnitudeA) * sqrt(magnitudeB));
  }
}
