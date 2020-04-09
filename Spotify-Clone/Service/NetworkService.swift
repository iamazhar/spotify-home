//
//  CommonFunctions.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

class NetworkService {
    
    // MARK: - Generic parse function
    
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
    static func networkCall(_ url: URL?, _ token: String?, completion: @escaping (Data?, Error?) -> Void) {
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: ", error.localizedDescription)
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Response failed with code: ", response ?? "Failed")
                return
            }
            
            completion(data, nil)
            
            
        }.resume()
    }
}
