//
//  ImageCache.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 7/1/23.
//

import Foundation

class ImageCache {
    /// Local image caching in NSData format, stores NSData in cache
    private let imageCache = NSCache<NSString, NSData>()
    
    func storeImageInCache(_ url: String, _ data: Data) {
        //store the data in cache
        self.imageCache.setObject(data as NSData, forKey: url as NSString)
    }
    
    func getImageFromCache(_ url: String) -> Data? {
        
        if let cachedImageData = self.imageCache.object(forKey: url as NSString) {
            return cachedImageData as Data
        }
        
        return nil
    }
}
