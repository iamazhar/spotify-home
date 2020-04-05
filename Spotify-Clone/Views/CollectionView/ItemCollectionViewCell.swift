//
//  TopItemCollectionViewCell.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
import Kingfisher

class ItemCollectionViewCell: UICollectionViewCell {
    
    let touchDownAnimDuration:Double = 0.25
    var didScaleDownOnTouch = false
    
    public var cellType: CellType = .regular {
        didSet {
            NSLayoutConstraint.activate([
                artworkImageView.heightAnchor.constraint(equalToConstant: cellType.value.width),
            ])
            artworkImageView.updateConstraints()
        }
    }

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
        let iv = UIImageView()
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

extension ItemCollectionViewCell {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.didScaleDownOnTouch = false
        self.setTouchDownState()
        super.touchesBegan(touches, with: event)
    }
    
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.setTouchUpStateWithAnimation()
        super.touchesCancelled(touches, with: event)
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.setTouchUpStateWithAnimation()
    }
    
    func setTouchDownState() {
        let touchDownScale: CGFloat = 0.965
        UIView.animate(withDuration: touchDownAnimDuration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.4, options: .curveLinear, animations: {
            self.transform = self.transform.scaledBy(x: touchDownScale, y: touchDownScale)
        }) { (_) in
            self.didScaleDownOnTouch = true
        }
    }
    
    func setTouchUpStateWithAnimation() {
        UIView.animate(withDuration: touchDownAnimDuration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
            self.transform = .identity
        }) { (_) in
            self.didScaleDownOnTouch = true
        }
    }
}
