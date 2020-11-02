//
//  SelectGifPresenter.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-10-29.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol SelectGifPresentationLogic: class {
    
    func presentSearchForGif(response: SelectGif.SearchForGif.Response)
    func presentSelectGif(response: SelectGif.SelectGif.Response)
}

class SelectGifPresenter: SelectGifPresentationLogic {
    
    weak var viewController: SelectGifDisplayLogic?
    
    func presentSearchForGif(response: SelectGif.SearchForGif.Response) {
        
        let urlStrings = response.welcome?.data?.compactMap{ $0.images?.downsized?.url }
        
        let viewModel = SelectGif.SearchForGif.ViewModel(urls: urlStrings)
        viewController?.displaySearchForGif(viewModel: viewModel)
    }
    
    
    func presentSelectGif(response: SelectGif.SelectGif.Response) {
        
        let viewModel = SelectGif.SelectGif.ViewModel(scene: .guessGif)
        viewController?.displaySelectGif(viewModel: viewModel)
    }
    
}
