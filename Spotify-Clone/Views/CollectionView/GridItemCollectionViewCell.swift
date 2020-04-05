//
//  GridItemCollectionViewCell.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
import Kingfisher

class GridItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Data
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
    
    // MARK:- Views
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.bgGridCell()
        view.layer.cornerRadius = 3.0
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let containerStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alignment = .center
        sv.spacing = 8.0
        sv.axis = .horizontal
        return sv
    }()
    
    public let artworkImageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 160, height: 160)))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    public let itemLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.text = "After Hours"
        label.font = UIFont(name: recentlyPlayedTitle.fontName,
                            size: recentlyPlayedTitle.fontSize)
        label.textColor = recentlyPlayedTitle.textColor
        return label
    }()
    
    // MARK: - Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        containerStackView.addArrangedSubview(artworkImageView)
        NSLayoutConstraint.activate([
            artworkImageView.heightAnchor.constraint(equalToConstant: 48.0),
            artworkImageView.widthAnchor.constraint(equalToConstant: 48.0)
        ])
        
        containerStackView.addArrangedSubview(itemLabel)
        
        containerView.addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5.0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
