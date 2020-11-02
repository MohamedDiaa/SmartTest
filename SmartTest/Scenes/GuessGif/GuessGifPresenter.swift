//
//  GuessGifPresenter.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-01.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol GuessGifPresentationLogic: class {
    
    func presentScene(response: GuessGif.FetchScene.Response)
    func presentAnswer(response: GuessGif.SubmitAnswer.Response)
}

class GuessGifPresenter: GuessGifPresentationLogic {
    
    weak var viewController: GuessGifDisplayLogic?
    
    func presentScene(response: GuessGif.FetchScene.Response){
        
        guard let urlString = response.selectURLString,
            let url = URL(string: urlString)
            else { return }
        
        let viewModel = GuessGif.FetchScene.ViewModel(selectURL: url)
        viewController?.displayScene(viewModel: viewModel)
    }
    
    func presentAnswer(response: GuessGif.SubmitAnswer.Response) {
        
        let viewModel = GuessGif.SubmitAnswer.ViewModel(scene: .score)
        viewController?.displayAnswer(viewModel: viewModel)
    }
}
