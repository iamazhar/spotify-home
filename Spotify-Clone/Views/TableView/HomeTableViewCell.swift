//
//  HomeTableViewCell.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var sectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: homeSectionTitle.fontName, size: homeSectionTitle.fontSize)
        label.text = "Top Tracks"
        return label
    }()

    var topItemCollectionView: TopItemCollectionView = {
        let cv = TopItemCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let sectionView: SectionView = {
        let sv = SectionView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        self.contentView.backgroundColor = .clear
        
        addSubview(sectionView)
        NSLayoutConstraint.activate([
            sectionView.topAnchor.constraint(equalTo: topAnchor),
            sectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
//        addSubview(topItemCollectionView)
//
//        NSLayoutConstraint.activate([
//            topItemCollectionView.topAnchor.constraint(equalTo: topAnchor),
//            topItemCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            topItemCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            topItemCollectionView.heightAnchor.constraint(equalToConstant: 140.0)
////            topItemCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
