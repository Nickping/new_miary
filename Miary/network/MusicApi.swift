//
//  MusicApi.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/08.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import Foundation
import StoreKit

class MusicApi {
    static let developerToken = Bundle.main.object(forInfoDictionaryKey: "musicToken") as! String
    
    func prepareSKCloud() {
        
        SKCloudServiceController.requestAuthorization { status in
            guard status == .authorized else { return }
            print("Authorization status is authorized")
        }
        
        let skcloudSericeController = SKCloudServiceController()
        let developerToken = "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IkM0V0tENENHREEifQ.eyJpYXQiOjE1ODMwNzcxMDMsImV4cCI6MTU5ODYyOTEwMywiaXNzIjoiOUhRNFlNWE43NCJ9.2j-gZ1oq74c_kLFWg1fr0qu1FFQGMuUVnd77aBxJSRQKkRUIGC_YLHOJ5F7tI8ApDVYoJFKnAZiMfR7YRewTMQ"
        
        
        
        skcloudSericeController.requestCapabilities { capabilities, error in
            if capabilities.contains(.musicCatalogPlayback) {
                // User has Apple Music account
                print("musicCatalogPlaback contained")
            } else {
                print("musicCatalogPlaback not contained")
            }
            
            print(capabilities)
            print(error)
            
        }
    }
    
    
    func search(term: String) {
        
        guard var components = URLComponents(string: "https://api.music.apple.com/v1/catalog/kr/search") else { return }
        let expectedTerms = term.replacingOccurrences(of: " ", with: "+")
        let urlParameters = ["term": expectedTerms,
                             "limit": "10",
                             "types": "albums"]
        var queryItems = [URLQueryItem]()
        for (key, value) in urlParameters {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        components.queryItems = queryItems
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(MusicApi.developerToken)",
            forHTTPHeaderField: "Authorization")
        
        data(with: request) { data, error -> Void in
            guard error == nil else {
                print(#function, "URL Session Task Failed", error!)
                //                    completionOnMain(nil)
                return
            }
            
            //                guard let searchResult = try? JSONDecoder().decode(SearchResult.self, from: data!) else {
            //                    print(#function, "JSON Decode Failed");
            ////                    completionOnMain(nil)
            //                    return
            //                }
            //                completionOnMain(searchResult)
        }
    }
    
    
    func data(with request: URLRequest, completion: @escaping (Data?, Error?) -> Swift.Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error -> Void in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, NSError(domain: "error", code: 30, userInfo: nil))
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                completion(nil, NSError(domain: "error", code: 30, userInfo: nil))
                return
            }
            
            completion(data, nil)
        }
        task.resume()
    }
    
}
