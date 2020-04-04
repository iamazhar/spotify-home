//
//  TopItemCollectionViewCell.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
import Kingfisher

class TopItemCollectionViewCell: UICollectionViewCell {

    public var imagePath: String? {
        didSet {
            if let path = imagePath, let url = URL(string: path) {
                artworkImageView.kf.setImage(with: url, options: [.transition(.fade(0.4))])
            }
        }
    }
    
    public var itemTitle: String? {
        didSet {
            if let title = itemTitle {
                self.itemLabel.text = title
                self.itemLabel.sizeToFit()
            }
        }
    }
    
    public let artworkImageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 113.0, height: 113.0)))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    public let itemLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "After Hours"
        label.font = UIFont(name: recentlyPlayedTitle.fontName,
                            size: recentlyPlayedTitle.fontSize)
        label.textColor = recentlyPlayedTitle.textColor
        return label
    }()
    
    public let artworkStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 8.0
        view.axis = .vertical
        view.alignment = .leading
        return view
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
        artworkStackView.addArrangedSubview(artworkImageView)
        
        artworkStackView.addArrangedSubview(itemLabel)
        NSLayoutConstraint.activate([
            itemLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        
        addSubview(artworkStackView)
        NSLayoutConstraint.activate([
            artworkStackView.topAnchor.constraint(equalTo: topAnchor),
            artworkStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            artworkStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            artworkStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
