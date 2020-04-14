//
//  SPTBrandTypography.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/7/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
/// Brand style struct with design tokens from the Spotify design system
struct BrandStyle {
    let fontName: String
    let fontSize: CGFloat
    let textColor: UIColor
    
    init(name: String, size: CGFloat, color: UIColor) {
        fontName = name
        fontSize = size
        textColor = color
    }
}

enum SPTFont: String {
    case
    recentlyPlayedTitle,
    homeSectionTitle
    
    var value: BrandStyle {
        switch self {
        case .recentlyPlayedTitle:
            return BrandStyle(name: "Montserrat-SemiBold", size: 11, color: UIColor.white)
        case .homeSectionTitle:
            return BrandStyle(name: "Montserrat-Bold", size: 20, color: UIColor.white)
        }
    }
}
