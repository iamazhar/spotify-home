//
//  HomeViewController.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let topItemView: TopItemCollectionView = {
        let view = TopItemCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundGradient() //
        
        view.addSubview(topItemView)
        NSLayoutConstraint.activate([
            topItemView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            topItemView.heightAnchor.constraint(equalToConstant: 150),
            topItemView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topItemView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        topItemView.backgroundColor = UIColor.clear
        
        
        SpotifyWebAPIService.shared.sptUserTop(itemType: .tracks) { (tracks, error) in
            if let error = error {
                print("Error: ", error)
                return
            }
            guard let userTracks = tracks else { return }
            
            print(userTracks)
            
            DispatchQueue.main.async {
                self.topItemView.tracks = userTracks
                DispatchQueue.main.async {
                    self.topItemView.reloadData()
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
