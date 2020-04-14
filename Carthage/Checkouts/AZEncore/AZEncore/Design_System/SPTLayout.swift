//
//  SPTLayout.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/7/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

/// Height for each section of the home screen
public enum SPTHomeSectionHeight: CGFloat {
    case grid, itemSmall, itemRegular
    
    var value: CGFloat {
        switch self {
        case .grid:
            return UIScreen.main.bounds.height / 4.0
        case .itemSmall:
            return UIScreen.main.bounds.height / 3.5
        case .itemRegular:
            return UIScreen.main.bounds.height / 3.0
        }
    }
}

/// Size of each item in a carousel style section.
public enum SPTCarouselCellSize: String {
    case small, regular
    
    var value: CGSize {
        switch self {
        case .small:
            return CGSize(width: 113, height: 150)
        case .regular:
            return CGSize(width: 160, height: 200)
        }
    }
}

/// Size of each item in a grid style section
public enum SPTGridCellSize: String {
    case regular
    
    var value: CGSize {
        switch self {
        case .regular:
            return CGSize(width: 190, height: 55)
        }
    }
}

/// Minimum spacing between each item in a section.
public enum SPTMinimumCellSpacing: CGFloat {
    case lineSpacing, interItem
    
    var value: CGFloat {
        switch self {
        case .lineSpacing:
            return 8.0
        case .interItem:
            return 2.0
        }
    }
}

/// Insets for the contents of a section.
public enum SPTInsets: CGFloat {
    case item, grid, homeTableView
    
    var value: UIEdgeInsets {
        switch self {
        case .item:
            return UIEdgeInsets(top: 0,
                                left: 15.0,
                                bottom: 15.0,
                                right: 15.0)
        case .grid:
            return UIEdgeInsets(top: 0.0,
                                left: 0.0,
                                bottom: 0.0,
                                right: 0.0)
        case .homeTableView:
            return UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        }
    }
}

/// Size of rectangular artwork image for varying cell styles.
public enum SPTArtworkRectSize: CGFloat {
    case grid
    var value: CGFloat {
        switch self {
        case .grid:
            return 55.0
        }
    }
}

