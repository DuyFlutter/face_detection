import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'face_detection_method_channel.dart';

abstract class FaceDetectionPlatform extends PlatformInterface {
  /// Constructs a FaceDetectionPlatform.
  FaceDetectionPlatform() : super(token: _token);

  static final Object _token = Object();

  static FaceDetectionPlatform _instance = MethodChannelFaceDetection();

  /// The default instance of [FaceDetectionPlatform] to use.
  ///
  /// Defaults to [MethodChannelFaceDetection].
  static FaceDetectionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FaceDetectionPlatform] when
  /// they register themselves.
  static set instance(FaceDetectionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<List<dynamic>?> getFaceDetection(Uint8List imageBytes) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
