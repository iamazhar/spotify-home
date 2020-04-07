//
//  HomeTableView.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

private let topItemReuseIdentifier = "top-cell"
private let gridItemReuseIdentifier = "grid-cell"

class HomeTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    public var tracks: [Track] = []
    public var artists: [Artist] = []

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        separatorStyle = .none
        contentInset = SPTInsets.homeTableView.value
        
        delegate = self
        dataSource = self
        
        register(ItemTableViewCell.self, forCellReuseIdentifier: topItemReuseIdentifier)
        register(GridTableViewCell.self, forCellReuseIdentifier: gridItemReuseIdentifier)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = dequeueReusableCell(withIdentifier: gridItemReuseIdentifier, for: indexPath) as! GridTableViewCell
            cell.sectionLabel.text = "Good evening"
            cell.gridItemCollectionView.tracks = Array<Track>(tracks.prefix(6))
            return cell
        case 1:
            let cell = ItemTableViewCell.init(style: .default, reuseIdentifier: topItemReuseIdentifier)
            cell.cellType = .small
            cell.backgroundColor = .red
            cell.sectionLabel.text = "Your top tracks"
            cell.topItemCollectionView.tracks = tracks
            return cell
        case 2:
            let cell = ItemTableViewCell.init(style: .default, reuseIdentifier: topItemReuseIdentifier)
            cell.sectionLabel.text = "Your top artists"
            cell.topItemCollectionView.artists = artists
            return cell
        default:
            let cell = ItemTableViewCell.init(style: .default, reuseIdentifier: topItemReuseIdentifier)
            cell.sectionLabel.text = "Your top tracks"
            cell.topItemCollectionView.tracks = tracks
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return SPTHomeSectionHeight.grid.value
        case 1:
            return SPTHomeSectionHeight.itemSmall.value
        default:
            return SPTHomeSectionHeight.itemRegular.value
        }

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
    }
}
