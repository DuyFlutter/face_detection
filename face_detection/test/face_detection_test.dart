// import 'package:flutter_test/flutter_test.dart';
// import 'package:face_detection/face_detection.dart';
// import 'package:face_detection/face_detection_platform_interface.dart';
// import 'package:face_detection/face_detection_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockFaceDetectionPlatform
//     with MockPlatformInterfaceMixin
//     implements FaceDetectionPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final FaceDetectionPlatform initialPlatform = FaceDetectionPlatform.instance;
//
//   test('$MethodChannelFaceDetection is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelFaceDetection>());
//   });
//
//   test('getPlatformVersion', () async {
//     FaceDetection faceDetectionPlugin = FaceDetection();
//     MockFaceDetectionPlatform fakePlatform = MockFaceDetectionPlatform();
//     FaceDetectionPlatform.instance = fakePlatform;
//
//     expect(await faceDetectionPlugin.getPlatformVersion(), '42');
//   });
// }
