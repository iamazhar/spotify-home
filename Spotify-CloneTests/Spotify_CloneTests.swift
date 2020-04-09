//
//  Spotify_CloneTests.swift
//  Spotify-CloneTests
//
//  Created by Azhar Anwar on 4/3/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import XCTest
@testable import Spotify_Clone

class Spotify_CloneTests: XCTestCase {
    
    func testItemTypeEnumStringValues() {
        let artistsValue = ItemType.artists.value
        let tracksValue = ItemType.tracks.value
        
        XCTAssertEqual(artistsValue, "artists")
        XCTAssertEqual(tracksValue, "tracks")
    }
    
    
    
}
