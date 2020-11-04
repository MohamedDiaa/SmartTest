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

class SelectGifTableViewController: BaseTableViewController, SelectGifDisplayLogic, UISearchBarDelegate, UISearchControllerDelegate , UISearchResultsUpdating {
    
    var interactor: SelectGifBusinessLogic?
    var router: SelectGifRoutingLogic?
    
    var searchViewModel : SelectGif.SearchForGif.ViewModel?
    
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
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let viewModel = searchViewModel
            else{ return 0 }
        
        return viewModel.urls?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GifTableViewCell.self), for: indexPath) as? GifTableViewCell
        
        // Configure the cell...
        
        let urlString = searchViewModel?.urls?[indexPath.row]
        cell?.load(with: urlString)
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let urlString = searchViewModel?.urls?[indexPath.row]

        let request = SelectGif.SelectGif.Request(selectedURL: urlString)
        interactor?.selectGif(request: request)
    }
    
    // MARK: - display logic
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else { return }
        
        let request =  SelectGif.SearchForGif.Request(query: text)
        interactor?.searchForGif(request: request)
    }
    
    func displaySearchForGif(viewModel: SelectGif.SearchForGif.ViewModel) {
        
        self.searchViewModel = viewModel
        
        DispatchQueue.main.async { [weak self] in
            
            self?.tableView.reloadData()
        }
    }
    
    func displaySelectGif(viewModel: SelectGif.SelectGif.ViewModel){
        
        switch viewModel.scene {
        case .guessGif:
            router?.routeToGuessGif()
        default:
            return
        }
    }
}
