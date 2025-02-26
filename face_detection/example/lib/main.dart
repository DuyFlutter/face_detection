import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:face_detection/face_detection.dart';

import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _faceDetectionPlugin = FaceDetection();

  final ImagePicker _picker = ImagePicker();
  List<XFile>? _mediaFileList;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _faceDetectionPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> getFaceCount(XFile? pickedFile) async {
    Uint8List? imageBytes = await pickedFile?.readAsBytes();

    if (imageBytes == null) return;

    final List<dynamic>? faceRects  = await _faceDetectionPlugin.detectFaces(imageBytes);
   debugPrint('faceRects :::::::::::::::::${faceRects?.length}');
  }

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 100,
          requestFullMetadata: false);

      if (pickedFile != null) {
        _setImageFileListFromFile(pickedFile);
        getFaceCount(pickedFile);
      }
    } catch (e) {
      debugPrint('Error :::::::${e.toString()}');
    }
  }

  void _setImageFileListFromFile(XFile? value) {
    _mediaFileList = value == null ? null : <XFile>[value];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pickImage();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

}
