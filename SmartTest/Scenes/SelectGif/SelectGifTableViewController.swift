//
//  SelectGifTableViewController.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-10-29.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import UIKit

protocol SelectGifDisplayLogic: class {
    
    func displaySearchForGif(viewModel: SelectGif.SearchForGif.ViewModel)
    func displaySelectGif(viewModel: SelectGif.SelectGif.ViewModel)
}

class SelectGifTableViewController: UITableViewController, SelectGifDisplayLogic, UISearchBarDelegate, UISearchControllerDelegate , UISearchResultsUpdating {
    
    var interactor: SelectGifBusinessLogic?
    var router: SelectGifRoutingLogic?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        
        let view = self
        let interactor = SelectGifInteractor()
        let presenter = SelectGifPresenter()
        let router = SelectGifRouter()
        
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
        search.searchBar.placeholder = "Search for a gif the test"
        navigationItem.searchController = search
        
        let startButton = UIBarButtonItem(title: "Start",
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
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
    
    func displaySearchForGif(viewModel: SelectGif.SearchForGif.ViewModel) {
        
    }
    
    func displaySelectGif(viewModel: SelectGif.SelectGif.ViewModel){
     
        router?.routeToGuessGif()

    }
    
    @IBAction func start() {

        let request = SelectGif.SelectGif.Request()
        interactor?.selectGif(request: request)
    }
}
