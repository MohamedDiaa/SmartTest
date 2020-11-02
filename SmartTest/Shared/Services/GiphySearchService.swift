//
//  GiphySearchService.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-02.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol GiphySearchServiceProtocol {
    
    func search(query: String, completion: @escaping (_ gifModel: Welcome?, _ error: Error?)->())
    
}

class GiphySearchService: GiphySearchServiceProtocol{
    
    var task: URLSessionTask?
    
    func search(query: String, completion: @escaping (_ gifModel: Welcome?, _ error: Error?)->()) {
        
        task?.cancel()
        
        guard let url = constructURL(query: query)
            else { return }
        
        task =  URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                
                let gifModel = try? JSONDecoder().decode(Welcome.self, from: data)
                completion(gifModel, nil)
                return
            }
            
            completion(nil, error)
        }
        
        task?.resume()
    }
    
    func constructURL(query: String) -> URL? {
        
        var components = URLComponents()
        components.scheme = URLResources.GiphySearch.scheme
        components.host = URLResources.GiphySearch.host
        components.path = URLResources.GiphySearch.path
        
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Env.shared.giphyAPIKey),
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "limit", value: "25"),
            URLQueryItem(name: "offset", value: "0"),
            URLQueryItem(name: "rating", value: "g"),
            URLQueryItem(name: "lang", value: "en")
        ]
        
        return components.url
    }
}
