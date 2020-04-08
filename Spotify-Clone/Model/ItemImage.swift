//
//  ItemImage.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/5/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

/// Codable ItemImage struct to parse Image array in API response.
struct ItemImage: Codable {
    var height: Int
    var width: Int
    var url: String
    
    private enum CodingKeys: String, CodingKey {
        case height, width, url
    }
    
    init(height: Int, width: Int, url: String) {
        self.height = height
        self.width = width
        self.url = url
    }
}
