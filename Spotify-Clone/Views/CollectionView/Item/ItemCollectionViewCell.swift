//
//  TopItemCollectionViewCell.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
import Kingfisher

/// Collection view cell for carousel style item.
class ItemCollectionViewCell: UICollectionViewCell {
    
    var didScaleDownOnTouch = false
    
    // MARK: - Data
    
    public var cellType: SPTCarouselCellSize = .regular {
        didSet {
            NSLayoutConstraint.activate([
                mediaItem.artworkImageView.heightAnchor.constraint(equalToConstant: cellType.value.width),
            ])
                mediaItem.artworkImageView.updateConstraints()
        }
    }

    public var imagePath: String? {
        didSet {
            if let path = imagePath, let url = URL(string: path) {
                mediaItem.artworkImageView.kf.setImage(with: url, options: [.transition(.fade(0.4))])
            }
        }
    }
    
    public var itemTitle: String? {
        didSet {
            if let title = itemTitle {
                mediaItem.itemLabel.text = title
                mediaItem.itemLabel.sizeToFit()
            }
        }
    }
    
    // MARK: - Views
    
    let mediaItem: MediaItem = {
        let mI = MediaItem(frame: .zero, mediaItemType: .carousel)
        mI.translatesAutoresizingMaskIntoConstraints = false
        return mI
    }()
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        layoutIfNeeded()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        self.contentView.backgroundColor = .clear
        
        addSubview(mediaItem)
        NSLayoutConstraint.activate([
            mediaItem.topAnchor.constraint(equalTo: topAnchor),
            mediaItem.leadingAnchor.constraint(equalTo: leadingAnchor),
            mediaItem.trailingAnchor.constraint(equalTo: trailingAnchor),
            mediaItem.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


