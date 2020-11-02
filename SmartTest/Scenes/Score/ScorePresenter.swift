//
//  ScorePresenter.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-02.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol ScorePresentationLogic: class {
    
    func presentScene(response: Score.FetchScene.Response)
}

class ScorePresenter: ScorePresentationLogic{
    
    weak var viewController: ScoreDisplayLogic?
    
    func presentScene(response: Score.FetchScene.Response) {
        
        let viewModel = Score.FetchScene.ViewModel(
            solution: response.solution,
            guess: response.guess,
            score: "\(response.score)"
        )
        viewController?.displayScene(viewModel: viewModel)
    }
}
