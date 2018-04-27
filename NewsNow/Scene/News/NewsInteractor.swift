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
    
    var news: [NewsModel]?
    
    init(presenter: NewsPresenterProtocol, worket: NewsWorker = NewsWorker()) {
        
        self.presenter = presenter
        self.worker = NewsWorker()
    }
}

extension NewsInteractor: NewsInteractorProtocol {
    func getNews() {
        worker.fetchNews(completion: { [weak self] news, error  in
            
            if let strongSelf = self {
                
                if let err = error {
                    
                    strongSelf.presenter.presentError(error: err)
                    
                } else if let newsArray = news {
                    
                    strongSelf.news = newsArray
                    strongSelf.presenter.presentNews(news: newsArray)
                }
            }
        })
    }
}
