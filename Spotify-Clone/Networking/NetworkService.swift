//
//  CommonFunctions.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

class NetworkService {
    
    private let engine: NetworkEngine
    
    init(engine: NetworkEngine = URLSession.shared) {
        self.engine = engine
    }
    
    /// Generic function that parses Data object into the specified type T using the JSONDecoder
    /// - Parameter data: Data type object
    /// - Returns: Object of Codable type T
    static func parseResults<T: Codable>(from data: Data) -> T? {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch let err {
            print("Failed to Decode: ", err)
        }
        return nil
    }
    
    /// Helper method that makes a URLSession network call.
    /// - Parameters:
    ///   - url: target URL
    ///   - token: Access Token for the API endpoint
    ///   - completion: Escaping closure with optional Data and Error type objects.
    func networkCall(_ request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        
        engine.performRequest(for: request) { (data, response, error) in
            if let error = error {
                print("Error: ", error.localizedDescription)
                completion(nil, error)
                return
            }
            completion(data, nil)
        }
    }
}
