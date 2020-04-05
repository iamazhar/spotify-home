//
//  GridTableViewCell.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/5/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

class GridTableViewCell: UITableViewCell {
    
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: homeSectionTitle.fontName, size: homeSectionTitle.fontSize)
        label.text = "Good Evening"
        return label
    }()
    
    var gridItemCollectionView: GridItemCollectionView = {
        let cv = GridItemCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
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
        containerStackView.addArrangedSubview(gridItemCollectionView)
        NSLayoutConstraint.activate([
            gridItemCollectionView.heightAnchor.constraint(equalToConstant: 184),
            gridItemCollectionView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor),
            gridItemCollectionView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor)
        ])
        
        addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
