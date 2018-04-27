//
//  NewsAPIStore.swift
//  NewsNow
//
//  Created by Tim on 24/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation
import SWXMLHash

enum NewsStoreError: Error {
    
    case generic
    case invalidURL
    case invalidResponse
}

protocol NewsStoreProtocol {
    func fetchNews(completion: @escaping ([NewsModel]?, Error?) -> ())
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
    func fetchNews(completion: @escaping ([NewsModel]?, Error?) -> ()) {
        
        XMLParserManager.shared.getNews(by: Constants.lentaRU) { /*[weak self]*/ result in
            completion(result, nil)
        }
    }
}
