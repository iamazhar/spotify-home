//
//  HomeTableView.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

class HomeTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var tracks: [Track] = []

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        separatorStyle = .none
        contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        
        delegate = self
        dataSource = self
        
        SpotifyWebAPIService.shared.sptUserTop(itemType: .tracks) { (tracks, error) in
            if let error = error {
                print("Error: ", error)
            }
            guard let userTracks = tracks else { return }
            self.tracks = userTracks
            
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
        
        register(HomeTableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeTableViewCell.init(style: .default, reuseIdentifier: "cellid")
        cell.sectionView.topItemCollectionView.tracks = tracks
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 400.0
        }
        return 230.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
}
