//
//  CommonFunctions.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

class CommonFunctions {
    
    // MARK: - Generic parse function
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
