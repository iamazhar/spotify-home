//
//  Result.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

/// Generic Result struct that can help parse a response that has top level key "items"
struct Result<T: Codable>: Codable  {
    var items: [T]
    
    private enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(items: [T]) {
        self.items = items
    }
}
