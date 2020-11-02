//
//  GuessGifTableViewController.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-01.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import UIKit

protocol  GuessGifDisplayLogic: class {
    
}

class GuessGifTableViewController: UITableViewController, GuessGifDisplayLogic, UISearchBarDelegate, UISearchControllerDelegate , UISearchResultsUpdating {
    
    var interactor: GuessGifBusinessLogic?
    var router: (GuessGifRoutingLogic & GuessGifDataPassing)?

    // MARK: - setup
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        
        let view = self
        let interactor = GuessGifInteractor()
        let presenter = GuessGifPresenter()
        let router = GuessGifRouter()
        
        view.interactor = interactor
        view.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = view
        
        router.viewController = view
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Guess what this gif is about"
        navigationItem.searchController = search
        
        let startButton = UIBarButtonItem(title: "Finish",
                                          style: .plain,
                                          target: self,
                                          action: #selector(start))
        
        navigationItem.rightBarButtonItems = [startButton]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = "Hello"
        cell.textLabel?.textColor = .black
        
        return cell
    }
    
    
    
    // MARK: - display logic
    
    func updateSearchResults(for searchController: UISearchController) {
        
        router?.routeToScore()
    }
    
    
    @IBAction func start() {
        
    }
}
