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
                return
            }
            if let token = token {
                self.accessToken = token
            }
        }
    }
    
    func testNetworkCall() {
        class NetworkEngineMock: NetworkEngine {
            typealias Handler = NetworkEngine.Handler

            var request: URLRequest?

            func performRequest(for urlRequest: URLRequest, completionHandler: @escaping Handler) {
                request = urlRequest

                let data = "Hello World".data(using: .utf8)!
                completionHandler(data, nil, nil)
            }
        }

        let engine = NetworkEngineMock()
        let loader = NetworkService(engine: engine)
        let expectation = self.expectation(description: "Check data match")

        var result = Data()
        let url = URL(string: "my/API")!
        let request = URLRequest(url: url)
        
        loader.networkCall(request) { (data, error) in
            if let data = data {
                result = data
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertEqual(engine.request, request)
        XCTAssertEqual(result, "Hello World".data(using: .utf8)!)
    }
    
    func testTracksNetworkCallForCountTwo() {
        // given
        let sptService = SpotifyWebAPIService(networkService: NetworkService())
        let itemType = ItemType.tracks
        var dummyTracks = [Track]()
        dummyTracks.append(Track(id: "1", album: Album(id: "1", images: [ItemImage]()), name: "Weeknd", artists: [Artist]()))
        dummyTracks.append(Track(id: "2", album: Album(id: "2", images: [ItemImage]()), name: "Weeknd", artists: [Artist]()))
        
        // when
        sptService.sptUserTop(itemType: itemType, count: 2) { ( tracks , artists, error) in
            if let error = error {
                print("Failed to get tracks: ", error)
                return
            }
            if let tracks = tracks {
                // then
                XCTAssertEqual(dummyTracks.count, tracks.count)
                XCTAssertNil(artists)
                XCTAssertNil(error)
            }
        }
    }
    
    
    func testArtistsNetworkCallForCountTwo() {
        // given
        let sptService = SpotifyWebAPIService(networkService: NetworkService())
        let itemType = ItemType.artists
        
        var dummyArtists = [Artist]()
        dummyArtists.append(Artist(id: "1", name: "Weeknd", images: [ItemImage]()))
        dummyArtists.append(Artist(id: "2", name: "Weeknd", images: [ItemImage]()))
        
        // when
        sptService.sptUserTop(itemType: itemType, count: 2) { ( tracks, artists , error) in
            if let error = error {
                print("Failed to get tracks: ", error)
                return
            }
            if let artists = artists {
                // then
                XCTAssertEqual(dummyArtists.count, artists.count)
                XCTAssertNil(tracks)
                XCTAssertNil(error)
            }
        }
    }
    

}