//
//  Album.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/3/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

struct Album: Codable {
    var id: String
    var images: [ItemImage]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case images
    }
    
    init(id: String, images: [ItemImage]) {
        self.id = id
        self.images = images
    }
    
}
