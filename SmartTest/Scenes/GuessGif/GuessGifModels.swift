//
//  GuessGifModels.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-01.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation


struct GuessGif{
    
    struct FetchScene {
        struct Request {
            
        }
        struct Response {
            var selectURLString: String?
        }
        struct ViewModel {
            var selectURL: URL
        }
    }
    
    struct SubmitAnswer {
        
        struct Request {
            var query: String?
        }
        struct Response {
            
        }
        struct ViewModel {
            var scene: Scene?
        }
    }
}
