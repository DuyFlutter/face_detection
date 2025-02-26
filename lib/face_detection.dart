
import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'face_detection_platform_interface.dart';

class FaceDetection {
  Future<String?> getPlatformVersion() {
    return FaceDetectionPlatform.instance.getPlatformVersion();
  }

   Future<List<dynamic>?> detectFaces(Uint8List imageBytes) async {
     return FaceDetectionPlatform.instance.getFaceDetection(imageBytes);
  }


}
