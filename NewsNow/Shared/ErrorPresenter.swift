//
//  ErrorPresenter.swift
//  NewsNow
//
//  Created by Tim on 27/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation
import UIKit


protocol ErrorPresenter {

    func presentError(viewModel: ErrorViewModel)
}


extension ErrorPresenter where Self: UIViewController {
    
    func presentError(viewModel: ErrorViewModel) {
        
        let alertController = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        
        if let buttonTitles = viewModel.buttonTitles {
            
            for title in buttonTitles {
                
                let action = UIAlertAction(title: title, style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(action)
            }
        }
        
        present(alertController, animated: true, completion: nil)
    }
}
