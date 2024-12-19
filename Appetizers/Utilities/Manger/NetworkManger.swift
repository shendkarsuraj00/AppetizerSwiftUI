//
//  NetworkManger.swift
//  Appetizers
//
//  Created by Macbook on 12/12/24.
//

import UIKit


final class NetworkManger {
    
    static let shared = NetworkManger()
    private var cache = NSCache<NSString, UIImage>()
    private var cacheKey = NSString()
    
    private init() {}
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private let appetizer = baseURL + "appetizers"
    
    func getAppetizer(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        guard let url = URL(string: appetizer) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { Data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let Data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoderResponse = try decoder.decode(AppetizerResponse.self, from: Data)
                completed(.success(decoderResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(formUrlString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: self.cacheKey)
            completed(image)
        }
        
        task.resume()
    }
    
}
