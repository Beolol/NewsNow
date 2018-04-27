//
//  NewsViewController.swift
//  NewsNow
//
//  Created by Tim on 22/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import UIKit

protocol NewsDisplayLogic: class
{
    func displayError(viewModel: ErrorViewModel)
}

class NewsViewController: UIViewController, ErrorPresenter {

    var router: NewsRouterProtocol?
    var interactor: NewsInteractorProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Initializers
    
    init(configurator: NewsConfigurator = NewsConfigurator.sharedInstance) {
        super.init(nibName:nil, bundle:nil)
        
        configure(configurator: configurator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        configure(configurator: NewsConfigurator.sharedInstance)
    }
    
    
    // MARK: - Configurator
    
    private func configure(configurator: NewsConfigurator = NewsConfigurator.sharedInstance) {
        
        configurator.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cellNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "NewsCell")
        
        interactor?.getNews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension NewsViewController: NewsDisplayLogic {
    func displayError(viewModel: ErrorViewModel) {
        
        presentError(viewModel: viewModel)
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        
        return cell
    }
}
