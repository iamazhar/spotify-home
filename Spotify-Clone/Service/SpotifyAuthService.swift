//
//  SpotifyAPIService.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/3/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
import SpotifyLogin

class SpotifyAuthService {
    
    public static let shared = SpotifyAuthService()
    
    private static let clientID = "4ff8e60b1da948e1af07650bde11ed97"
    private static let clientSecret = "11af8f29c55a436fb7c5154813a7be81"
    private static let redirectURL: URL = URL(string: "spotify-ios-quick-start://spotify-login-callback")!
    
    
    /// Private method that checks if the access token exists and completes with a Bool and optional Error object..
    /// - Parameter completion: Bool and Error objects.
    /// - Returns: void
    private func sptLoginPrivate(completion: @escaping (Bool, Error?) -> ()) {
        
        SpotifyLogin.shared.getAccessToken { (token, error) in
            if error != nil, token == nil {
                completion(false, error)
                return
            }
            completion(true, nil)
        }
    }
    
}

// MARK: - Public methods

extension SpotifyAuthService {
    
    /// Set configuration of SpotifyLogin framework using clientID, clientSecret, and the redirectURL
    public func sptLoginConfigure() {
        SpotifyLogin.shared.configure(clientID: SpotifyAuthService.clientID,
        clientSecret: SpotifyAuthService.clientSecret,
        redirectURL: SpotifyAuthService.redirectURL)
    }
    
    /// Public method that Initiates Spotify login.
    /// - Parameter completion: Bool and optional Error objects.
    /// - Returns: void
    public func sptLogin(completion: @escaping (Bool, Error?) -> ()) {
        sptLoginPrivate { (handled, error) in
            if let error = error {
                print("Failed to log in ")
                completion(handled, error)
                return
            }
            completion(handled, nil)
            return
        }
    }
    
    /// Public method to check if access token exists.
    /// - Parameter completion: Bool and optional Error object.
    /// - Returns: void
    public func sptCheckAccessToken(completion: @escaping (Bool, String?, Error?) -> ()) {
        SpotifyLogin.shared.getAccessToken { (token, error) in
            if error != nil, token == nil {
                completion(false, nil, error)
                return
            }
            completion(true, token, nil)
        }
    }
}

