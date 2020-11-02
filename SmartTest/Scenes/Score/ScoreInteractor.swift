//
//  ScoreInteractor.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-02.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol ScoreBusinessLogic: class {
    
    func fetchScene(request: Score.FetchScene.Request)
}

protocol ScoreDataStore: class {
    
    var solution: String? {get set}
    var guess: String? {get set}
}

class ScoreInteractor: ScoreBusinessLogic, ScoreDataStore {
    
    var presenter: ScorePresentationLogic?
    
    var solution: String?
    var guess: String?
    
    func fetchScene(request: Score.FetchScene.Request) {
        
        guard let solution = solution,
            let guess = guess
            else{ return }
        
        let score = solution.levenshtein(guess)
        
        let response = Score.FetchScene.Response(
            solution: solution,
            guess: guess,
            score: score
        )
        presenter?.presentScene(response: response)
    }
}
