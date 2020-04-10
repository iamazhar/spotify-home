//
//  HomeTableViewCell.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

private var cellHeightAdjust: CGFloat = 30.0

/// Table view cell for carousel style section.
@objcMembers
class ItemTableViewCell: UITableViewCell {
    
    public var cellType: SPTCarouselCellSize = .regular {
        didSet {
            itemCollectionView.cellType = cellType
            NSLayoutConstraint.activate([
                itemCollectionView.heightAnchor.constraint(equalToConstant: cellType.value.height + cellHeightAdjust)
            ])
            itemCollectionView.updateConstraints()
        }
    }
    
    private var containerStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alignment = .leading
        sv.axis = .vertical
        sv.spacing = 15.0
        return sv
    }()
    
    var sectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: SPTFont.homeSectionTitle.value.fontName, size: SPTFont.homeSectionTitle.value.fontSize)
        label.text = "Top Tracks"
        return label
    }()

    var itemCollectionView: ItemCollectionView = {
        let cv = ItemCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        self.contentView.backgroundColor = .clear
    
        containerStackView.addArrangedSubview(UIView(frame: CGRect(origin: .zero, size: .init(width: frame.width, height: 15.0))))
        
        containerStackView.addArrangedSubview(sectionLabel)
        
        containerStackView.addArrangedSubview(itemCollectionView)
        NSLayoutConstraint.activate([
            itemCollectionView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor),
            itemCollectionView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor)
        ])
        
        addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
