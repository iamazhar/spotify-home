//
//  HomeTableViewCell.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

private var cellHeightAdjust: CGFloat = 20.0

class ItemTableViewCell: UITableViewCell {
    
    public var cellType: CellType = .regular {
        didSet {
            topItemCollectionView.cellType = cellType
            NSLayoutConstraint.activate([
                topItemCollectionView.heightAnchor.constraint(equalToConstant: cellType.value.height + cellHeightAdjust)
            ])
            topItemCollectionView.updateConstraints()
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
        label.font = UIFont(name: homeSectionTitle.fontName, size: homeSectionTitle.fontSize)
        label.text = "Top Tracks"
        return label
    }()

    var topItemCollectionView: ItemCollectionView = {
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
    
        containerStackView.addArrangedSubview(sectionLabel)
        containerStackView.addArrangedSubview(topItemCollectionView)
        
        NSLayoutConstraint.activate([
//            topItemCollectionView.heightAnchor.constraint(equalToConstant: cellType.value.height),
            topItemCollectionView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor),
            topItemCollectionView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor)
        ])
        
        addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.0),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.0),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
