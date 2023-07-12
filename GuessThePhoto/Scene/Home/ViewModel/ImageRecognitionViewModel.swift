//
//  ImageRecognitionViewModel.swift
//  GuessThePhoto
//
//  Created by Baris on 12.07.2023.
//

import UIKit

class ImageRecognitionViewModel {
    private let imageRecognitionService = ImageRecognitionService()
    
    func recognizeImage(image: UIImage, completion: @escaping (Result<ImageRecognitionResult, Error>) -> Void) {
        guard let ciImage = CIImage(image: image) else {
            completion(.failure(ImageRecognitionError.analysisFailed))
            return
        }
        
        imageRecognitionService.recognizeImage(image: ciImage, completion: completion)
    }
}


