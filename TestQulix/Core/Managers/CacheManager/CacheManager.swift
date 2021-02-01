//
//  CacheManager.swift
//  TestQulix
//
//  Created by Nikita Moskalenko on 2/1/21.
//

import UIKit

// MARK: - CacheManager

final class CacheManager {
    
    static let shared = CacheManager()
    
    public func cacheImage(urlString: String, cachedImage: NSCache<NSString, UIImage>) -> UIImage {
        var image = UIImage()
        guard let url = URL(string: urlString) else { return UIImage() }
        if let cacheImg = cachedImage.object(forKey: url.absoluteString as NSString) {
            image = cacheImg
            return image
        } else {
            guard let img = UIImage(data: RequestManager.shared.getImageDataFromString(url)) else { return UIImage() }
            image = img
            return image
        }
    }
    
}
