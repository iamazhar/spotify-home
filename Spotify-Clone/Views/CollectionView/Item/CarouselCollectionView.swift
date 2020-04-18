//
//  CarouselCollectionView.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

/// Collection view for Carousel style section.
class CarouselCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    public var tracks: [Track] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    public var artists: [Artist] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    public var cellType: SPTCarouselCellSize = .regular
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        dataSource = self
        delegate = self
        
        register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: Constant.itemReuseIdentifier)
        
        setupLayout()
        
    }
    
    fileprivate func setupLayout() {
        self.backgroundColor = .clear
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = SPTInsets.carousel.value
        layout.minimumLineSpacing = SPTMinimumCellSpacing.lineSpacing.value
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
        if tracks.isEmpty {
            return artists.count
        }
        return tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: Constant.itemReuseIdentifier, for: indexPath) as! CarouselCollectionViewCell
        
        if tracks.isEmpty {
            let imagePath = artists[indexPath.item].images?[1].url
            cell.imagePath = imagePath
            cell.cellType = cellType
            cell.itemTitle = artists[indexPath.item].name
            return cell
        }
        
        let imagePath = tracks[indexPath.item].album.images[1].url
        cell.imagePath = imagePath
        cell.cellType = cellType
        cell.itemTitle = tracks[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellType.value
    }
    
}
