//
//  SelectGifModel.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-10-29.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

struct SelectGif {
    
    struct SearchForGif {
        
        struct Request {
            var query: String?
        }
        struct Response {
          
            var welcome: Welcome?
            var error: Error?
        }
        
        struct ViewModel {
            var urls: [String]?
        }
    }
    
    struct SelectGif {
        struct Request {
            
        }
        struct Response {
            
        }
        
        struct ViewModel {
            
        }
    }
}
