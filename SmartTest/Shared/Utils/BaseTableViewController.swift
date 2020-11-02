//
//  BaseTableViewController.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-02.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    func registerCells() {
        
        let tableViewCell = String(describing: UITableViewCell.self)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewCell)
        
        let gifCell = String(describing: GifTableViewCell.self)
        tableView.register(UINib(nibName: gifCell, bundle: nil), forCellReuseIdentifier: gifCell)
    }
}
