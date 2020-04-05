//
//  SpotifyWebAPIService.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
import SpotifyLogin

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
    
    private let baseUrl: String = "https://api.spotify.com/v1/me"
    
    /**
     Singleton object to access and execute API methods
     */
    public static let shared = SpotifyWebAPIService()
    
    /**
     Public method to fetch the user's top tracks using the Spotify Web API
     - Parameter completion: A closure that provides tracks and error objects
     */
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
    
    
    private func sptPrivateUserTop(itemType: ItemType, completion: @escaping ([Track]?, [Artist]?, Error?) ->()) {
        SpotifyLogin.shared.getAccessToken { [weak self] (token, error) in
            guard let self = self else { return }
            if let error = error {
                print("Failed to get access token", error)
                completion(nil, nil, error)
                return
            }
            
            // delete this
            print(token ?? "")
            
            let url = URL(string: "\(self.baseUrl)/top/\(itemType.value)?time_range=medium_term&limit=10&offset=5")
            
            CommonFunctions.networkCall(url, token) { (data, error) in
                if let error = error {
                    print("Network call failed: ", error)
                    return
                }
                
                if let receivedData = data {
                    // TODO: - Parse based on itemType
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
    
}
