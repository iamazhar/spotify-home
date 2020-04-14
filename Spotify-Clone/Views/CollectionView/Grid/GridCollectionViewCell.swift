//
//  GridCollectionViewCell.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
import Kingfisher

/// Cell for grid style items.
@objcMembers
class GridCollectionViewCell: SPTItemCell {
    
    // MARK: - Properties
    public var imagePath: String? {
        didSet {
            if let path = imagePath, let url = URL(string: path) {
                mediaItemView.artworkImageView.kf.setImage(with: url, options: [.transition(.fade(0.4))])
            }
        }
    }

    public var itemTitle: String? {
        didSet {
            if let title = itemTitle {
                mediaItemView.itemLabel.text = title
                mediaItemView.itemLabel.sizeToFit()
            }
        }
    }
    
    // MARK:- Views
    
    let mediaItemView: MediaItem = {
        let mediaItem = MediaItem(frame: .zero, mediaItemType: .grid)
        mediaItem.translatesAutoresizingMaskIntoConstraints = false
        return mediaItem
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupLayout() {
        addSubview(mediaItemView)
        NSLayoutConstraint.activate([
            mediaItemView.topAnchor.constraint(equalTo: topAnchor),
            mediaItemView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mediaItemView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mediaItemView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
}


