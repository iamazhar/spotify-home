//
//  TrackViewModel.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/7/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

protocol ItemsViewModelDelegate: class {
    func didReceiveTracksData(with tracks: [Track])
    func didReceiveArtistsData(with artists: [Artist])
}

public class ItemsViewModel {
    
    weak var delegate: ItemsViewModelDelegate?
    
    /// Fetch data from service method.
    func getTracks() {
        SpotifyWebAPIService.shared.sptUserTop(itemType: .tracks) { [weak self] (tracks, _, error) in
            if let error = error {
                print("Error: ", error)
            }
            guard let strongSelf = self else { return }
            if let userTracks = tracks {
                strongSelf.delegate?.didReceiveTracksData(with: userTracks)
            }
        }
    }
    
    func getArtists() {
        SpotifyWebAPIService.shared.sptUserTop(itemType: .artists) { [weak self] (_, artists, error) in
            if let error = error {
                print("Error: ", error)
            }
            if let strongSelf = self, let userArtists = artists {
                strongSelf.delegate?.didReceiveArtistsData(with: userArtists)
            }
        }
    }
    
    
}
