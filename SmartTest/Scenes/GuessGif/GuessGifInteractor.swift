//
//  GuessGifInteractor.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-01.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol GuessGifBusinessLogic: class {
    
}

protocol GuessGifDataStore: class {
    
    var selectedURL: String? { get set }
}

class GuessGifInteractor: GuessGifBusinessLogic, GuessGifDataStore {
    
    var presenter: GuessGifPresentationLogic?
    var selectedURL: String? 

    
}
