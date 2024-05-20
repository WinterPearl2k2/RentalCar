import 'dart:io';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final photos = <File>[];
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    initializeCameras();
  }

  Future<void> initializeCameras() async {
    // await Permission.camera.request();
    cameras = await availableCameras();
    setState(() {}); // Refresh the widget tree after obtaining cameras
  }

  void openCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CameraCamera(
          resolutionPreset: ResolutionPreset.ultraHigh,
          cameraSide: CameraSide.front,
          enableZoom: true,
          onFile: (file) async {
            InputImage inputImage = InputImage.fromFile(file);
            final textRecognizer =
                TextRecognizer(script: TextRecognitionScript.latin);
            final RecognizedText recognizedText =
                await textRecognizer.processImage(inputImage);
            String text = recognizedText.text;
            Map<String, String> extractedInfo = extractInfo(text);
            extractedInfo.forEach((key, value) {
              print('$key: $value');
            });

            photos.add(file);
            Navigator.pop(context);
            setState(() {});
          },
        ),
      ),
    );
  }

  Map<String, String> extractInfo(String text) {
    final Map<String, String> info = {};

    final noRegExp = RegExp(r'(?:No|Na)\.?:?\s*([0-9]+)');
    final nameRegExp =
        RegExp(r'Full name:\s*([A-ZÀ-Ỹ ]+)', caseSensitive: false);
    final dobRegExp =
        RegExp(r'Date of birth:\s*([\d/]+)', caseSensitive: false);
    final sexRegExp = RegExp(r'Sex:\s*([^\s]+)', caseSensitive: false);
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
      info['Full name'] = nameMatch.group(1)!.trim();
    }
    if (dobMatch != null) {
      info['Date of birth'] = dobMatch.group(1)!;
    }
    if (sexMatch != null) {
      info['Sex'] = sexMatch.group(1)!;
    }
    if (nationalityMatch != null) {
      info['Nationality'] = nationalityMatch.group(1)!;
    }
    if (originMatch != null) {
      info['Place of origin'] = originMatch.group(1)!.trim();
    }

    return info;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('camera'),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: photos.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width,
            child: Image.file(
              photos[index],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCamera,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
