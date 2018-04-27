//
//  NewsPresenter.swift
//  NewsNow
//
//  Created by Tim on 22/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation

protocol NewsPresenterProtocol: class {
    func presentNews(news: [NewsModel])
    
    func presentError(error: Error)
}

class NewsPresenter {
    weak var vc: NewsDisplayLogic?
    
    init(viewController: NewsDisplayLogic) {
        
        self.vc = viewController
    }
}

extension NewsPresenter: NewsPresenterProtocol {
    func presentError(error: Error) {
        let errorViewModel = ErrorViewModel(title: Strings.Error.genericTitle,
                                            message: Strings.Error.genericMessage,
                                            buttonTitles: [Strings.Error.okButtonTitle])
        
        vc?.displayError(viewModel: errorViewModel)
    }
    
    func presentNews(news: [NewsModel]) {
        print(news)
    }
    
}
