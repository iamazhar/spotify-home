//
//  SectionView.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

class SectionView: UIView {
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: homeSectionTitle.fontName, size: homeSectionTitle.fontSize)
        label.text = "Section Title"
        return label
    }()
    
    var topItemCollectionView: TopItemCollectionView = {
        let cv = TopItemCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        addSubview(sectionLabel)
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: topAnchor),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0)
        ])
        
        addSubview(topItemCollectionView)
        NSLayoutConstraint.activate([
            topItemCollectionView.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 8.0),
            topItemCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topItemCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            topItemCollectionView.heightAnchor.constraint(equalToConstant: 180.0)
            topItemCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
