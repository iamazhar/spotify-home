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
    
    var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    /// Spotify Web API base URL
    private let baseUrl: String = "https://api.spotify.com/v1/me"
    
    /// Public method to provide the logged in user's top tracks and artists.
    /// - Parameters:
    ///   - itemType: Enum that represents the track or artist type.
    ///   - completion: Escaping closure that provides three optionals. [Track]? ,[Artist]?, and Error?
    /// - Returns: nil
    public func sptUserTop(itemType: ItemType, count: Int, completion: @escaping ([Track]?, [Artist]?, Error?) -> ()) {
        sptPrivateUserTop(itemType: itemType, count: count) { (tracks, artists, error) in
            if let error = error {
                completion(nil, nil, error)
            }
            
            switch itemType {
            case .artists:
                DispatchQueue.main.async {
                    completion(nil, artists, nil)
                }
            case .tracks:
                DispatchQueue.main.async {
                    completion(tracks, nil, nil)
                }
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
    private func sptPrivateUserTop(itemType: ItemType, count: Int, completion: @escaping ([Track]?, [Artist]?, Error?) ->()) {
        SpotifyLogin.shared.getAccessToken { [weak self] (token, error) in
            guard let strongSelf = self else { return }
            if let error = error {
                print("Failed to get access token", error)
                completion(nil, nil, error)
                return
            }
            
            guard let url = URL(string: "\(strongSelf.baseUrl)/top/\(itemType.value)?time_range=medium_term&limit=\(count)&offset=5") else { return }
            
            var request = URLRequest(url: url)
            NetworkService.addSPTHeaders(to: &request, with: token ?? "")
            
            strongSelf.networkService.networkCall(request) { (data, error) in
                if let error = error {
                    print("Network call failed: ", error)
                    return
                }
                
                guard let receivedData = data else { return }
                
                switch itemType {
                case .tracks:
                    guard let itemsResult: Result<Track> = NetworkService.parseResults(from: receivedData) else { return }
                    completion(itemsResult.items, nil, nil)
                case .artists:
                    guard let itemsResult: Result<Artist> = NetworkService.parseResults(from: receivedData) else { return }
                    completion(nil, itemsResult.items, nil)
                }
            }
        }
    }
    
}
