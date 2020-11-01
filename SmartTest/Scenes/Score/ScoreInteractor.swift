//
//  ScoreInteractor.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-02.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol ScoreBusinessLogic: class {
    
}

protocol ScoreDataStore: class {
    
}

class ScoreInteractor: ScoreBusinessLogic, ScoreDataStore {
    
    var presenter: ScorePresentationLogic?
}
