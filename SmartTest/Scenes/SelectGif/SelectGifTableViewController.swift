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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = search

        
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
        
    }
}
