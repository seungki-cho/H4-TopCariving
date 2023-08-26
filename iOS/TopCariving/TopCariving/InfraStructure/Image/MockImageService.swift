//
//  MockImageService.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/18.
//

import UIKit

class MockImageService {
    static let shared = MockImageService()
    private let cache = ImageCacheService.shared
    
    private init() { }
    
    func loadImage(with stringURL: String) async -> UIImage? {
        if let image = cache.loadImage(key: stringURL) {
            return image
        }
        
        guard let url = URL(string: stringURL),
              let response = try? await URLSession.shared.data(from: url),
              let image = UIImage(data: response.0) else { return nil }
        
        cache.saveImage(key: stringURL, image: image)
        
        return image
    }
}
