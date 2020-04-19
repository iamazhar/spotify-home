//
//  SPTItemCell.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/7/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

class SPTItemCell: UICollectionViewCell {
    
    var didScaleDownOnTouch = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        let touchDownScale: CGFloat = SPTAnimationPressCellProperty.touchDownScale.value
        UIView.animate(withDuration: TimeInterval(SPTAnimationPressCellProperty.touchDownDuration.value),
                       delay: TimeInterval(SPTAnimationPressCellProperty.delay.value),
                       usingSpringWithDamping: SPTAnimationPressCellProperty.damping.value,
                       initialSpringVelocity: SPTAnimationPressCellProperty.velocity.value,
                       options: .curveLinear,
                       animations: {
            self.transform = self.transform.scaledBy(x: touchDownScale, y: touchDownScale)
        }) { (_) in
            self.didScaleDownOnTouch = true
        }
    }
    
    func setTouchUpStateWithAnimation() {
        UIView.animate(withDuration: TimeInterval(SPTAnimationPressCellProperty.touchDownDuration.value),
                       delay: TimeInterval(SPTAnimationPressCellProperty.delay.value),
                       usingSpringWithDamping: SPTAnimationPressCellProperty.damping.value,
                       initialSpringVelocity: SPTAnimationPressCellProperty.velocity.value,
                       options: .curveEaseInOut,
                       animations: {
            self.transform = .identity
        }) { (_) in
            self.didScaleDownOnTouch = true
        }
    }
    
}
