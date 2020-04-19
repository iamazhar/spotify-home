//
//  NetworkTests.swift
//  Spotify-CloneTests
//
//  Created by Azhar Anwar on 4/11/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import XCTest
@testable import Spotify_Clone

class NetworkTests: XCTestCase {

    var accessToken: String = ""
    
    override func setUp() {
        SpotifyAuthService.shared.sptCheckAccessToken { (exists, token, error) in
            if let error = error {
                print("Failed to check token:", error)
            }
            if let token = token {
                self.accessToken = token
                XCTAssertNotNil(token)
            }
        }
    }
    
    func testParseResultDecodedObjectNotNil() {
        // give
        let jsonData = StaticData.data!
        
        // when
        if let sut: Result<Track> = NetworkService.parseResults(from: jsonData) {
            // then
            XCTAssertNotNil(sut)
        } else {
            XCTAssertTrue(false)
        }
        
    }
    
    func testTracksNetworkCallForCount() {
        // given
        let sut = SpotifyWebAPIService(networkService: NetworkService())
        let itemType = ItemType.tracks
        
        // when
        sut.sptUserTop(itemType: itemType, count: 2) { ( tracks , artists, error) in
            if let error = error {
                print("Failed to get tracks: ", error)
                XCTAssertThrowsError(error)
            }
            if let tracks = tracks {
                // then
                XCTAssertEqual(2, tracks.count)
                XCTAssertNil(artists)
                XCTAssertNil(error)
            }
        }
    }
    
    
    func testArtistsNetworkCallForCount() {
        // given
        let sut = SpotifyWebAPIService(networkService: NetworkService())
        let itemType = ItemType.artists
        
        // when
        sut.sptUserTop(itemType: itemType, count: 2) { ( tracks, artists , error) in
            if let error = error {
                print("Failed to get tracks: ", error)
                XCTAssertThrowsError(error)
            }
            if let artists = artists {
                // then
                XCTAssertEqual(2, artists.count)
                XCTAssertNil(tracks)
                XCTAssertNil(error)
            }
        }
    }
    

}
