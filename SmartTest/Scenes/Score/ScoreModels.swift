//
//  ScoreModels.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-02.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

struct Score {
    
    struct FetchScene {
        struct Request {
        }
        struct Response {
            var solution: String?
            var guess: String?
        }
        struct ViewModel {
            var solution: String?
            var guess: String?
        }
    }
}
