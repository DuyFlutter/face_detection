import Flutter
import UIKit

public class FaceDetectionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "face_detection", binaryMessenger: registrar.messenger())
    let instance = FaceDetectionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)

      case "detectFaces":
       if let imageData = call.arguments as? FlutterStandardTypedData,
                                let image = UIImage(data: imageData.data) {
                                 FaceDetection.detectFaces(in: image) { observations in
                                     if let observations = observations {
                                         let faceRects = observations.map { observation in
                                             return [
                                                 "x": observation.boundingBox.origin.x,
                                                 "y": observation.boundingBox.origin.y,
                                                 "width": observation.boundingBox.size.width,
                                                 "height": observation.boundingBox.size.height
                                             ]
                                         }
                                         result(faceRects)
                                     } else {
                                         result(nil)
                                     }
                                 }
                             } else {
                                 result(nil)
                             }
    default:
      result(FlutterMethodNotImplemented)
    }
  }

}
