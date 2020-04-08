//
//  HomeTableView.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

/// Table view for home tab with multiple sections.
class HomeTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        separatorStyle = .none
        contentInset = SPTInsets.homeTableView.value
        
        register(ItemTableViewCell.self, forCellReuseIdentifier: Common.itemReuseIdentifier)
        register(GridTableViewCell.self, forCellReuseIdentifier: Common.gridItemReuseIdentifier)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
