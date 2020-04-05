//
//  Item.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

struct Track: Codable {
    var id: String
    var album: Album
    var name: String
    var artists: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case id, album, name, artists
    }
    
    init(id: String, album: Album, name: String, artists: [Artist]) {
        self.id = id
        self.album = album
        self.name = name
        self.artists = artists
    }
    
}
