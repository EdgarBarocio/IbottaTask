//
//  ServiceCalls.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 7/1/23.
//

import Foundation

class ServiceCalls {
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    typealias ImageDownloadResult = (Data) -> Void
    
    /**
     Service call that downloads and stores image data to cache.
        Made de decision to implement the Cache here to avoid making service calls for assets previously called
     
     - Parameters:
        - url: Weather image URL in string format
        - completion: Closure that passes the image data from service or cache to the View Model
     */
    func downloadImage(url: String, completion:@escaping ImageDownloadResult) {
        dataTask?.cancel()
        
        let cache = ImageCache()
        
        if let cachedImageData = cache.getImageFromCache(url) {
            completion(cachedImageData)
            return
        }
        
        guard let imageURL = URL(string: url) else {
            return
            
        }
        
        dataTask = defaultSession.dataTask(with: imageURL) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            
            if let error = error {
                print(error.localizedDescription)
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                //store the data in cache
                cache.storeImageInCache(url, data)
                
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }
        
        dataTask?.resume()
    }
}
