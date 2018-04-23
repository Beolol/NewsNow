//
//  NewsConfigurator.swift
//  NewsNow
//
//  Created by Tim on 22/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation
import SWXMLHash

final class NewsConfigurator {
    
    static let sharedInstance = NewsConfigurator()
    
    private init() {}
    
    // MARK: - Configuration
    func configure(viewController: NewsViewController) {
        
        let router = NewsRouter(viewController: viewController)
        let presenter = NewsPresenter(viewController: viewController)
        let interactor = NewsInteractor(presenter: presenter)

        viewController.interactor = interactor
        viewController.router = router
    }
}
