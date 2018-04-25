//
//  NewsInteractor.swift
//  NewsNow
//
//  Created by Tim on 22/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation

protocol NewsInteractorProtocol: class {
    func getNews()
}

class NewsInteractor {
    let presenter: NewsPresenterProtocol
    let worker: NewsWorker
    
    init(presenter: NewsPresenterProtocol, worket: NewsWorker = NewsWorker()) {
        
        self.presenter = presenter
        self.worker = NewsWorker()
    }
}

extension NewsInteractor: NewsInteractorProtocol {
    func getNews() {
        worker.fetchNews(completion: { news, error  in
            
            if let n = news {
                
            }
            if let e = error {
                
            }
            
        })
    }
}
