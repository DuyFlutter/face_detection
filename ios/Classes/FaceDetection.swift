import Foundation
import Vision
import UIKit

class FaceDetection {
    static func detectFaces(in image: UIImage, completion: @escaping ([VNFaceObservation]?) -> Void) {
        guard let cgImage = image.cgImage else {
            completion(nil)
            return
        }
        
        let request = VNDetectFaceRectanglesRequest { (request, error) in
            if let error = error {
                print("Face detection error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let results = request.results as? [VNFaceObservation] else {
                completion(nil)
                return
            }
            
            completion(results)
        }
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        do {
            try handler.perform([request])
        } catch {
            print("Failed to perform face detection: \(error.localizedDescription)")
            completion(nil)
        }
    }
}
