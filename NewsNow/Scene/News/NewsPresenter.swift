//
//  NewsPresenter.swift
//  NewsNow
//
//  Created by Tim on 22/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation

protocol NewsPresenterProtocol: class {
    
}

class NewsPresenter {
    weak var vc: NewsDisplayLogic?
    
    init(viewController: NewsDisplayLogic) {
        
        self.vc = viewController
    }
}

extension NewsPresenter: NewsPresenterProtocol {
    
}
