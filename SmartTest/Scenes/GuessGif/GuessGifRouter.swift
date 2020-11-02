//
//  GuessGifRouter.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-01.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import UIKit

protocol GuessGifRoutingLogic {
    
     func routeToScore()
}

protocol GuessGifDataPassing {
    
    var dataStore: GuessGifDataStore? { get set }
}

class GuessGifRouter: GuessGifRoutingLogic, GuessGifDataPassing{
    
    weak var viewController: GuessGifTableViewController?
    weak var dataStore: GuessGifDataStore?

    func routeToScore() {
        
        let name = String(describing: Score.self)
        guard let destination = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController() as? ScoreViewController
            else{ return }
        
        navigateToScore(source: viewController,
                           destination: destination)
    }
    
    // MARK: - navigation
    
    func navigateToScore(source: UIViewController?, destination: UIViewController) {
        
        source?.navigationController?.pushViewController(destination, animated: true)
    }

}
