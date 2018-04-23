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
    
    init(presenter: NewsPresenterProtocol) {
        
        self.presenter = presenter
    }
}

extension NewsInteractor: NewsInteractorProtocol {
    
}
