//
//  ScoreRouter.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-02.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol ScoreRoutingLogic {
    
}

protocol ScoreDataPassing {
    
    var dataStore: ScoreDataStore? {get set}
}

class ScoreRouter: ScoreRoutingLogic, ScoreDataPassing{
    
    weak var viewController: ScoreViewController?
    weak var dataStore: ScoreDataStore?
    
}
