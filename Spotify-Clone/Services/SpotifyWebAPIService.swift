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
    public func sptUserTop(itemType: ItemType, completion: @escaping ([Track]?, Error?) -> ()) {
        sptPrivateUserTop(itemType: itemType) { (tracks, error) in
            if let error = error {
                completion(nil, error)
            }
            completion(tracks, nil)
        }
    }
}


extension SpotifyWebAPIService {
    
    
    private func sptPrivateUserTop(itemType: ItemType, completion: @escaping ([Track]?, Error?) ->()) {
        SpotifyLogin.shared.getAccessToken { (token, error) in
            
            if let error = error {
                print("Failed to get access token", error)
                completion(nil, error)
                return
            }
            
            //
            let url = URL(string: "\(self.baseUrl)/top/\(itemType.value)?time_range=medium_term&limit=10&offset=5")
            
            var request = URLRequest(url: url!)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: ", error.localizedDescription)
                    completion(nil, error)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("Response failed with code: ", response ?? "Failed")
                    return
                }
                
                if let receivedData = data {
                    // TODO: - Parse based on itemType
                    guard let itemsResult: Result<Track> = CommonFunctions.parseResults(from: receivedData) else { return }
                    completion(itemsResult.items, nil)
                }
            }.resume()
            //
        }
    }
    
}
