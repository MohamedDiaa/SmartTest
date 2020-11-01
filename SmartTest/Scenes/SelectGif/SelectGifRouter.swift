//
//  SelectGifRouter.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-10-29.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import UIKit

protocol SelectGifRoutingLogic {
    
    func routeToGuessGif()
}

class SelectGifRouter: SelectGifRoutingLogic {
    
    weak var viewController: SelectGifTableViewController?
    weak var dataStore: SelectGifDataStore?
    
    func routeToGuessGif() {
        
        let name = String(describing: GuessGif.self)
        guard let destination = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController() as? GuessGifTableViewController
            else{ return }
        
        navigateToGuessGif(source: viewController,
                           destination: destination)
    }
    
    // MARK: - navigation
    
    func navigateToGuessGif(source: UIViewController?, destination: UIViewController) {
        
        source?.navigationController?.pushViewController(destination, animated: true)
    }
}
