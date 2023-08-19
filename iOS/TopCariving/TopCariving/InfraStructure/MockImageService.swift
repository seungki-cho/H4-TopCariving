//
//  MockImageService.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/18.
//

import UIKit

class MockImageService {
    static let shared = MockImageService()
    private init() { }
    func loadImage(with url: String) async -> Data? {
        guard let url = URL(string: url),
              let response = try? await URLSession.shared.data(from: url) else { return nil}
        return response.0
    }
}

extension UIImage {
    static func imageService(url: String) async -> UIImage? {
        guard let data = await MockImageService.shared.loadImage(with: url) else { return nil }
        return UIImage(data: data)
    }
}

extension UIImageView {
    func setAsyncImage(url: String, size: CGSize? = nil) {
        Task {
            var image = await UIImage.imageService(url: url)
            if let size = size {
                image = image?.resized(to: size)
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
