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
    
    let mediaItemView: MediaItemView = {
        let mediaItem = MediaItemView(frame: .zero, mediaItemType: .grid)
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
        mediaItemView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
}


