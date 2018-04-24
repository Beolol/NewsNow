//
//  NewsAPIStore.swift
//  NewsNow
//
//  Created by Tim on 24/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation


enum NewsStoreError: Error {
    
    case generic
    case invalidURL
    case invalidResponse
}

protocol NewsStoreProtocol {
    
}


final class NewsAPIStore {
    
    fileprivate struct Constants {
        static let lentaRU = "https://lenta.ru/rss/news"
    }
    
    // MARK: - Initializers
    init() {
        
    }
}

extension NewsAPIStore: NewsStoreProtocol {

}
