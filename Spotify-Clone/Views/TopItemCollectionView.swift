//
//  TopItemCollectionView.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

private let reuseIdentifier = "itemCell"

class TopItemCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    public var tracks: [Track] = []
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        dataSource = self
        delegate = self
        
        register(TopItemCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        setupLayout()
        
    }
    
    fileprivate func setupLayout() {
        self.backgroundColor = .clear
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        collectionViewLayout = layout
        showsHorizontalScrollIndicator = false
        reloadData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("Fatal error: required init not implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TopItemCollectionViewCell
        let imagePath = tracks[indexPath.item].album.images[1].url
        cell.imagePath = imagePath
        cell.itemTitle = tracks[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 113, height: 150)
    }
    
    
}
