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

class SelectGifInteractor: SelectGifBusinessLogic {
    
    func searchForGif(request: SelectGif.SearchForGif.Request){
        
    }
    
    func selectGif(request: SelectGif.SelectGif.Request){
        
    }
}
