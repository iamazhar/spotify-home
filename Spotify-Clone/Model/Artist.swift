//
//  Artist.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

struct Artist: Codable {
    var id: String
    var name: String
    var images: [ItemImage]?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, images
    }
    
    init(id: String, name: String, images: [ItemImage]) {
        self.id = id
        self.name = name
        self.images = images
    }
}
