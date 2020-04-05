//
//  HomeTableView.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

class HomeTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var tracks: [Track] = [] {
        didSet {
            print("HOME TABLE VIEW: ", tracks[0])
        }
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        separatorStyle = .none
        contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        
        delegate = self
        dataSource = self
        
        register(HomeTableViewCell.self, forCellReuseIdentifier: "cellid")
        register(GridTableViewCell.self, forCellReuseIdentifier: "grid-cell")
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
//            let cell = GridTableViewCell.init(style: .default, reuseIdentifier: "grid-cell")
            let cell = dequeueReusableCell(withIdentifier: "grid-cell", for: indexPath) as! GridTableViewCell
            cell.sectionLabel.text = "Good Evening"
            cell.gridItemCollectionView.tracks = Array<Track>(tracks.prefix(6))
            return cell
        } else {
            let cell = HomeTableViewCell.init(style: .default, reuseIdentifier: "cellid")
            cell.sectionView.sectionLabel.text = "Top Artists"
            cell.sectionView.topItemCollectionView.tracks = tracks
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 220.0
        }
        return 250.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
}
