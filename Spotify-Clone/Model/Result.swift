//
//  Result.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

struct Result<T: Codable>: Codable  {
    var items: [T]
    
    private enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(items: [T]) {
        self.items = items
    }
}
