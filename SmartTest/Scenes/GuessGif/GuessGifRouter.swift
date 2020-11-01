//
//  GuessGifRouter.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-01.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol GuessGifRoutingLogic {
    
}

class GuessGifRouter: GuessGifRoutingLogic{
    
    weak var viewController: GuessGifTableViewController?
    weak var dataStore: GuessGifDataStore?
}
