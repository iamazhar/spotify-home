//
//  TrackViewModel.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/7/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

/// Protocol with methods that fire when data has been received or when failed to receive.
protocol ItemsViewModelDelegate: class {
    func didReceiveItemData()
    func didFailReceivingData(with error: Error)
}

/// Items view model class that serves data to all views inside the tableview
public class ItemsViewModel {
    
    var tracks = [Track]()
    var artists = [Artist]()
    var sptWebAPIService: SpotifyWebAPIService
    
    
    weak var delegate: ItemsViewModelDelegate?
    
    init(sptWebAPIService: SpotifyWebAPIService) {
        self.sptWebAPIService = sptWebAPIService
    }
    
    /// Fetch user's top Tracks data from SpotifyWebAPIService.
    func getTracks() {
        sptWebAPIService.sptUserTop(itemType: .tracks, count: 10) { [weak self] (tracks, _, error) in
            guard let strongSelf = self else { return }
            if let error = error {
                print("Error: ", error)
                strongSelf.delegate?.didFailReceivingData(with: error)
            }
            
            guard let userTracks = tracks else { return }
            strongSelf.tracks = userTracks
            DispatchQueue.main.async {
                strongSelf.delegate?.didReceiveItemData()
            }
        }
    }
    
    /// Fetch user's top Artists data from SpotifyWebAPIService.
    func getArtists() {
        sptWebAPIService.sptUserTop(itemType: .artists, count: 10) { [weak self] (_, artists, error) in
            guard let strongSelf = self else { return }
            if let error = error {
                print("Error: ", error)
                strongSelf.delegate?.didFailReceivingData(with: error)
            }
            
            guard let userArtists = artists else { return }
            strongSelf.artists = userArtists
            DispatchQueue.main.async {
                strongSelf.delegate?.didReceiveItemData()
            }
            
        }
    }
    
    
}
