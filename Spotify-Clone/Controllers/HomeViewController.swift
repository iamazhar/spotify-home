//
//  HomeViewController.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var tableView: HomeTableView = {
        let tv = HomeTableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundGradient() //
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.backgroundColor = UIColor.clear
        
        
        SpotifyWebAPIService.shared.sptUserTop(itemType: .tracks) { (tracks, error) in
            if let error = error {
                print("Error: ", error)
                return
            }
            guard let userTracks = tracks else { return }
            
            print(userTracks)
            
            DispatchQueue.main.async {
                self.tableView.tracks = userTracks
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    fileprivate func setupBackgroundGradient() {
        let layer = CAGradientLayer()
        layer.frame = view.frame
        layer.colors = [UIColor.homeBgGradientTop().cgColor, UIColor.homeBgGradientBottom().cgColor]
        layer.locations = [0.0, 0.35]
        view.layer.addSublayer(layer)
    }
    
}
