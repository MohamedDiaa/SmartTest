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
        
        let viewModel = SelectGif.SearchForGif.ViewModel()
        viewController?.displaySearchForGif(viewModel: viewModel)
    }
    
    
    func presentSelectGif(response: SelectGif.SelectGif.Response) {
        
        let viewModel = SelectGif.SelectGif.ViewModel()
        viewController?.displaySelectGif(viewModel: viewModel)
    }
    
}
