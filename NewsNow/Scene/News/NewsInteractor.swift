//
//  NewsInteractor.swift
//  NewsNow
//
//  Created by Tim on 22/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation

protocol NewsInteractorProtocol: class {
    
}

class NewsInteractor {
    weak var presenter: NewsPresenterProtocol?
    weak var worker: NewsWorker?
    
    init(presenter: NewsPresenterProtocol, worket: NewsWorker = NewsWorker()) {
        
        self.presenter = presenter
        self.worker = worket
    }
}

extension NewsInteractor: NewsInteractorProtocol {
    
}
