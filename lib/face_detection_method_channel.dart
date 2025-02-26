import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'face_detection_platform_interface.dart';

/// An implementation of [FaceDetectionPlatform] that uses method channels.
class MethodChannelFaceDetection extends FaceDetectionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('face_detection');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<List<dynamic>?> getFaceDetection(Uint8List imageBytes) async {
    final List<dynamic>? faceRects = await methodChannel.invokeMethod('detectFaces', imageBytes);
    return faceRects;
  }


}
