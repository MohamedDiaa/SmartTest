//
//  GuessGifInteractor.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-01.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol GuessGifBusinessLogic: class {
    
    func fetchScene(request: GuessGif.FetchScene.Request)
    func submitAnswer(request: GuessGif.SubmitAnswer.Request)
}

protocol GuessGifDataStore: class {
    
    var selectedURL: String? { get set }
    var solution: String? { get set }
    var guess: String? { get set }
}

class GuessGifInteractor: GuessGifBusinessLogic, GuessGifDataStore {
    
    var presenter: GuessGifPresentationLogic?
 
    var selectedURL: String?
    var solution: String?
    var guess: String?
    
    func fetchScene(request: GuessGif.FetchScene.Request) {
        
        let response = GuessGif.FetchScene.Response(selectURLString: selectedURL)
        presenter?.presentScene(response: response)
    }
    
    func submitAnswer(request: GuessGif.SubmitAnswer.Request) {
        
        self.guess = request.query
        
        let response = GuessGif.SubmitAnswer.Response()
        presenter?.presentAnswer(response: response)
    }
}
