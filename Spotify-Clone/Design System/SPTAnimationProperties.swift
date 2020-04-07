//
//  SPTAnimationProperties.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/7/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

public enum SPTAnimationPressCellProperty: String {
    case
    touchDownDuration,
    touchDownScale,
    delay,
    damping,
    velocity
    
    var value: CGFloat {
        switch self {
        case .touchDownDuration:
            return 0.25
        case .touchDownScale:
            return 0.965
        case .delay:
            return 0.0
        case .damping:
            return 0.9
        case .velocity:
            return 0.4
        }
    }
}


