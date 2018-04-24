//
//  NewsWorker.swift
//  NewsNow
//
//  Created by Tim on 24/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation
class NewsWorker {
    
    fileprivate var store: NewsStoreProtocol
    
    
    // MARK: - Initializers

    init(store: NewsStoreProtocol = NewsAPIStore()) {
        
        self.store = store
    }
    
    
    // MARK: - Business Logic
    
    func fetchNews(completion: @escaping ([String]?, Error?) -> ()) {
        
        store.fetchNews(completion: completion)
    }
}
