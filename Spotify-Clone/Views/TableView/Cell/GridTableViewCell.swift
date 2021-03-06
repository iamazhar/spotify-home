//
//  GridTableViewCell.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/5/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

/// Table view cell for grid style section.
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
        label.font = UIFont(name: SPTFont.homeSectionTitle.value.fontName, size: SPTFont.homeSectionTitle.value.fontSize)
        label.text = "Good Evening"
        return label
    }()
    
    var gridCollectionView: GridCollectionView = {
        let cv = GridCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        self.backgroundColor = .clear
        
        containerStackView.addArrangedSubview(sectionLabel)
        containerStackView.addArrangedSubview(gridCollectionView)
        
        gridCollectionView.anchor(top: nil, leading: containerStackView.leadingAnchor, bottom: nil, trailing: containerStackView.trailingAnchor, size: .init(width: .zero, height: 184))
        
        addSubview(containerStackView)
        containerStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: 15))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
