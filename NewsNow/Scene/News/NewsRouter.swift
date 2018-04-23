//
//  NewsRouter.swift
//  NewsNow
//
//  Created by Tim on 22/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation
protocol NewsRouterProtocol {
    func navigateToNewsDescription(atIndexPath indexPath: IndexPath)
}

class NewsRouter {
    weak var vc: NewsViewController?
    
    init(viewController: NewsViewController) {
        
        self.vc = viewController
    }
}

extension NewsRouter: NewsRouterProtocol {
    
    func navigateToNewsDescription(atIndexPath indexPath: IndexPath) {
        
    }
}

