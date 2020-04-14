//
//  GridCollectionView.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

/// Collection view for grid style section.
class GridCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    public var tracks: [Track] = []

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        showsVerticalScrollIndicator = false
        dataSource = self
        delegate = self
        
        register(GridCollectionViewCell.self, forCellWithReuseIdentifier:  Common.gridItemReuseIdentifier)
        
        setupLayout()
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = SPTInsets.grid.value
        layout.minimumLineSpacing = SPTMinimumCellSpacing.lineSpacing.value
        layout.minimumInteritemSpacing = SPTMinimumCellSpacing.interItem.value
        collectionViewLayout = layout
        showsHorizontalScrollIndicator = false
        reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: Common.gridItemReuseIdentifier, for: indexPath) as! GridCollectionViewCell
        let imagePath = tracks[indexPath.item].album.images[1].url
        cell.imagePath = imagePath
        cell.itemTitle = tracks[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SPTGridCellSize.regular.value
    }
    
}
