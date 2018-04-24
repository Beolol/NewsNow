//
//  NewsAPI.swift
//  NewsNow
//
//  Created by Tim on 24/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    
    case generic
    case invalidURL
}

protocol NetworkClientProtocol {
    
    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}

class NewsAPI: NetworkClientProtocol {

    
    static let sharedInstance = NewsAPI()
    
    let session: URLSession!
    
    
    // MARK: - Initialisers

    private init() {
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        configuration.timeoutIntervalForRequest = 5.0
        
        session = URLSession(configuration: configuration)
    }

    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        guard let url = request.url else {
            
            completion(nil, nil, NetworkError.invalidURL)
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                
                completion(data, response, error)
            }
            
        }.resume()
    }
}
