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
}
