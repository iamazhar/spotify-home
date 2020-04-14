//
//  GridItemView.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/14/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

enum MediaItemType: String {
    case carousel, grid
}

class MediaItem: UIView {
    
    // MARK: - Views
    
    /// Artwork image
    public let artworkImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    /// Item label
    public let itemLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "After Hours"
        label.font = UIFont(name: SPTFont.recentlyPlayedTitle.value.fontName,
                            size: SPTFont.recentlyPlayedTitle.value.fontSize)
        label.textColor = SPTFont.recentlyPlayedTitle.value.textColor
        return label
    }()
    
    /// Background view with color
    private let containerBgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor().bgGridCell()
        view.layer.cornerRadius = 3.0
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// Container stack view
    private let containerStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// Convenience initializer
    /// - Parameters:
    ///   - frame: CGRect object for frame.
    ///   - mediaItemType: MediaType enum for grid or carousel type.
    convenience init(frame: CGRect,
                     mediaItemType: MediaItemType) {
        self.init(frame: frame)
        setupLayout(mediaItemType: mediaItemType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupLayout(mediaItemType: MediaItemType) {
        switch mediaItemType {
        case .carousel:
            // stack view props setup
            containerStackView.spacing = 8.0
            containerStackView.axis = .vertical
            containerStackView.alignment = .leading
            
            // add views
            containerStackView.addArrangedSubview(artworkImageView)
            containerStackView.addArrangedSubview(itemLabel)
            
            addSubview(containerStackView)
            NSLayoutConstraint.activate([
                containerStackView.topAnchor.constraint(equalTo: topAnchor),
                containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        case .grid:
            // stack view props setup
            containerStackView.spacing = 8.0
            containerStackView.axis = .horizontal
            containerStackView.alignment = .center
            
            // add views
            containerStackView.addArrangedSubview(artworkImageView)
            NSLayoutConstraint.activate([
                artworkImageView.heightAnchor.constraint(equalToConstant: SPTArtworkRectSize.grid.value),
                artworkImageView.widthAnchor.constraint(equalToConstant: SPTArtworkRectSize.grid.value)
            ])
            
            containerStackView.addArrangedSubview(itemLabel)
            
            containerBgView.addSubview(containerStackView)
            NSLayoutConstraint.activate([
                containerStackView.topAnchor.constraint(equalTo: containerBgView.topAnchor),
                containerStackView.bottomAnchor.constraint(equalTo: containerBgView.bottomAnchor),
                containerStackView.leadingAnchor.constraint(equalTo: containerBgView.leadingAnchor),
                containerStackView.trailingAnchor.constraint(equalTo: containerBgView.trailingAnchor)
            ])
            
            addSubview(containerBgView)
            NSLayoutConstraint.activate([
                containerBgView.topAnchor.constraint(equalTo: topAnchor),
                containerBgView.bottomAnchor.constraint(equalTo: bottomAnchor),
                containerBgView.leadingAnchor.constraint(equalTo: leadingAnchor),
                containerBgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5.0)
            ])
        }
    }
    
}
