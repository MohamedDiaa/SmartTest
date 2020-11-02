//
//  SelectGifInteractor.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-10-29.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol SelectGifBusinessLogic: class {
    
    func searchForGif(request: SelectGif.SearchForGif.Request)
    func selectGif(request: SelectGif.SelectGif.Request)
}

protocol SelectGifDataStore: class {
    
    var selectedURL: String? { get set }
    var solution: String? {get set }
}

class SelectGifInteractor: SelectGifBusinessLogic, SelectGifDataStore {
    
    var presenter: SelectGifPresentationLogic?
    var giphySearchService: GiphySearchServiceProtocol =  GiphySearchService()
    
    var selectedURL: String?
    var solution: String?
    
    func searchForGif(request: SelectGif.SearchForGif.Request){
        
        guard let query = request.query, query.count > 2
            else{ return }
        
        giphySearchService.search(query: query, completion: { [weak self] (welcome, error) in
                
            self?.solution = query
            let response = SelectGif.SearchForGif.Response(welcome: welcome, error: error)
            self?.presenter?.presentSearchForGif(response: response)
        })
    }
    
    func selectGif(request: SelectGif.SelectGif.Request){
        
        guard  let selected = request.selectedURL
            else { return }
        
        selectedURL = selected

        let response = SelectGif.SelectGif.Response()
        presenter?.presentSelectGif(response: response)
    }
}
