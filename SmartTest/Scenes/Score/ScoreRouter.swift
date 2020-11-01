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

class ScoreRouter: ScoreRoutingLogic{
    
    weak var viewController: ScoreViewController?
    weak var dataStore: ScoreDataStore?
    
}
