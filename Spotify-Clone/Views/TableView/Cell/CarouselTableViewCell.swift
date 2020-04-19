//
//  CarouselTableViewCell.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

private var cellHeightAdjust: CGFloat = 30.0

/// Table view cell for carousel style section.
@objcMembers
class CarouselTableViewCell: UITableViewCell {
    
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
    
    private var labelStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alignment = .center
        sv.axis = .horizontal
        sv.spacing = 15.0
        return sv
    }()
    
    var sectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: SPTFont.homeSectionTitle.value.fontName, size: SPTFont.homeSectionTitle.value.fontSize)
        label.text = "Top Tracks"
        return label
    }()

    var itemCollectionView: CarouselCollectionView = {
        let cv = CarouselCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        self.backgroundColor = .clear
        
        // section label stack view
        labelStackView.addArrangedSubview(UIView())
        labelStackView.addArrangedSubview(sectionLabel)
    
        // container stack view
        containerStackView.addArrangedSubview(labelStackView)
        containerStackView.addArrangedSubview(itemCollectionView)
        itemCollectionView.anchor(top: nil, leading: containerStackView.leadingAnchor, bottom: nil, trailing: containerStackView.trailingAnchor)
        
        // add to view
        addSubview(containerStackView)
        containerStackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
