//
//  SpotifyWebAPIService.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
import SpotifyLogin

/// Item type enum that currently provides .tracks and .artists
public enum ItemType: String {
    case artists, tracks
    
    var value: String {
        switch self {
        case .artists:
            return "artists"
        case .tracks:
            return "tracks"
        }
    }
}

class SpotifyWebAPIService {
    
    /// Spotify Web API base URL
    private let baseUrl: String = "https://api.spotify.com/v1/me"
    
    /// Singleton object that provides access to the API methods.
    public static let shared = SpotifyWebAPIService()
    
    
    /// Public method to provide the logged in user's top tracks and artists.
    /// - Parameters:
    ///   - itemType: Enum that represents the track or artist type.
    ///   - completion: Escaping closure that provides three optionals. [Track]? ,[Artist]?, and Error?
    /// - Returns: nil
    public func sptUserTop(itemType: ItemType, completion: @escaping ([Track]?, [Artist]?, Error?) -> ()) {
        sptPrivateUserTop(itemType: itemType) { (tracks, artists, error) in
            if let error = error {
                completion(nil, nil, error)
            }
            
            if tracks != nil {
                completion(tracks, nil, nil)
            } else if artists != nil {
                completion(nil, artists, nil)
            }
            
        }
    }
}


extension SpotifyWebAPIService {
    
    /// Private method that makes the network call using the access token and returns an Array of object type Track or Artist based on the itemType value passed as argument.
    /// - Parameters:
    ///   - itemType: Enum that provides .artist or .track values.
    ///   - completion: Escaping closure that provides three optional objects. [Track]?, [Artist]?, and Error?
    /// - Returns: nil
    private func sptPrivateUserTop(itemType: ItemType, completion: @escaping ([Track]?, [Artist]?, Error?) ->()) {
        SpotifyLogin.shared.getAccessToken { [weak self] (token, error) in
            guard let self = self else { return }
            if let error = error {
                print("Failed to get access token", error)
                completion(nil, nil, error)
                return
            }
            
            let url = URL(string: "\(self.baseUrl)/top/\(itemType.value)?time_range=medium_term&limit=10&offset=5")
            
            CommonFunctions.networkCall(url, token) { (data, error) in
                if let error = error {
                    print("Network call failed: ", error)
                    return
                }
                
                guard let receivedData = data else { return }
                
                switch itemType {
                case .tracks:
                    guard let itemsResult: Result<Track> = CommonFunctions.parseResults(from: receivedData) else { return }
                    completion(itemsResult.items, nil, nil)
                case .artists:
                    guard let itemsResult: Result<Artist> = CommonFunctions.parseResults(from: receivedData) else { return }
                    completion(nil, itemsResult.items, nil)
                }
            }
        }
    }
    
    
    
}
