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
    func presentSelectGif(request: SelectGif.SelectGif.Response)
}

class SelectGifPresenter: SelectGifPresentationLogic {
    
    weak var viewController: SelectGifDisplayLogic?
    
    func presentSelectGif(request: SelectGif.SelectGif.Response) {
        
        let viewModel = SelectGif.SelectGif.ViewModel()
        viewController?.displaySelectGif(viewModel: viewModel)
    }
    
    func presentSearchForGif(response: SelectGif.SearchForGif.Response) {
        
        let viewModel = SelectGif.SearchForGif.ViewModel()
        viewController?.displaySearchForGif(viewModel: viewModel)
    }
}
