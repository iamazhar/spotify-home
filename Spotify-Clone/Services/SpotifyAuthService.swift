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
    
    private static var accessToken = UserDefaults.standard.string(forKey: Common.kAccessTokenKey) {
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(accessToken, forKey: Common.kAccessTokenKey)
        }
    }
    
    private static let clientID = "4ff8e60b1da948e1af07650bde11ed97"
    private static let clientSecret = "11af8f29c55a436fb7c5154813a7be81"
    private static let redirectURL: URL = URL(string: "spotify-ios-quick-start://spotify-login-callback")!
    
    
    private func sptLoginPrivate(completion: @escaping (Bool, Error?) -> ()) {
        
        SpotifyLogin.shared.getAccessToken { (token, error) in
            if error != nil, token == nil {
                completion(false, error)
                return
            }
            SpotifyAuthService.accessToken = token
            print("Saved access token")
            completion(true, nil)
        }
    }
    
}

// MARK: - Public methods

extension SpotifyAuthService {
    
    // configure
    public func sptLoginConfigure() {
        SpotifyLogin.shared.configure(clientID: SpotifyAuthService.clientID,
        clientSecret: SpotifyAuthService.clientSecret,
        redirectURL: SpotifyAuthService.redirectURL)
    }
    
    public func sptLogin(completion: @escaping (Bool, Error?) -> ()) {
        SpotifyAuthService.shared.sptLoginPrivate { (handle, error) in
            if let error = error {
                print("Failed to log in ")
                completion(false, error)
                return
            }
            completion(true, nil)
            return
        }
    }
    
    public func sptCheckAccessToken(completion: @escaping (Bool, Error?) -> ()) {
        SpotifyLogin.shared.getAccessToken { (token, error) in
            if error != nil, token == nil {
                completion(false, error)
                return
            }
            SpotifyAuthService.accessToken = token
            completion(true, nil)
        }
    }
}

