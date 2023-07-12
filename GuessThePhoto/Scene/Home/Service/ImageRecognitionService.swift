//
//  ImageRecognitionService.swift
//  GuessThePhoto
//
//  Created by Baris on 12.07.2023.
//

import CoreML
import Vision
import CoreImage

struct ImageRecognitionResult {
    let confidenceLevel: Int
    let identifier: String
}

class ImageRecognitionService {
    func recognizeImage(image: CIImage, completion: @escaping (Result<ImageRecognitionResult, Error>) -> Void) {
        
        guard let model = try? VNCoreMLModel(for: MobileNetV2().model) else {
            completion(.failure(ImageRecognitionError.modelLoadingFailed))
            return
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            
            guard let results = request.results as? [VNClassificationObservation], let topResult = results.first else {
                completion(.failure(ImageRecognitionError.analysisFailed))
                return
            }
            
            let confidenceLevel = Int(topResult.confidence * 100)
            let result = ImageRecognitionResult(confidenceLevel: confidenceLevel, identifier: topResult.identifier)
            completion(.success(result))
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        DispatchQueue.global(qos: .userInteractive).async {
            do {
                try handler.perform([request])
            } catch {
                completion(.failure(ImageRecognitionError.analysisFailed))
            }
        }
    }
}

enum ImageRecognitionError: Error {
    case modelLoadingFailed
    case analysisFailed
}

