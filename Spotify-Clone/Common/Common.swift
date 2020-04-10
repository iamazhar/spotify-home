//
//  Common.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/3/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

@objcMembers
class Common: NSObject {
    /// Constant for key string used to store access token as a Key-value pair.
    static let kAccessTokenKey = "access-token-key"
    
    /// Reuse identifiers
    static let itemReuseIdentifier = "item-cell"
    static let gridItemReuseIdentifier = "grid-cell"
}
