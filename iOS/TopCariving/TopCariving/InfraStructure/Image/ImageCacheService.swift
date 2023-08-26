//
//  ImageCacheService.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/26.
//

import UIKit

class ImageCacheService {
    static let shared = ImageCacheService()
    
    private let memoryCache = NSCache<NSString, UIImage>()
    private let fileManager = FileManager.default
    private let pathURL: URL
    
    private init() {
        let directory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
        pathURL = directory.appendingPathComponent("ImageCache")
        try? fileManager.createDirectory(at: pathURL, withIntermediateDirectories: true, attributes: nil)
        memoryCache.totalCostLimit = 50 * 1024 * 1024
    }
    func loadImage(key: String) -> UIImage? {
        if let image = memoryCache.object(forKey: NSString(string: key)) {
            return image
        }
        
        if let data = try? Data(contentsOf: pathURL.appendingPathComponent(key)),
           let image = UIImage(data: data) {
            memoryCache.setObject(image, forKey: NSString(string: key))
            return image
        }
        
        return nil
    }
    func saveImage(key: String, image: UIImage) {
        memoryCache.setObject(image, forKey: NSString(string: key))
        let fileURL = pathURL.appendingPathComponent(key)
        if let data = image.pngData() {
            try? data.write(to: fileURL)
        }
    }
}
