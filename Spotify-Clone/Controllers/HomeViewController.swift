//
//  HomeViewController.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
import SpotifyLogin

class HomeViewController: UIViewController {
    
    private lazy var signOutButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
//        b.setTitle("Sign Out", for: .normal)
        b.setImage(UIImage(systemName: "gear")?.tinted(with: .white), for: .normal)
        b.addTarget(self, action: #selector(handleSignOut), for: .touchUpInside)
        b.setTitleColor(UIColor.label, for: .normal)
        return b
    }()
    
    @objc fileprivate func handleSignOut() {
        SpotifyLogin.shared.logout()
        print("Did Sign out")
        showLoginFlow()
    }
    
    private lazy var tableView: HomeTableView = {
        let tv = HomeTableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        
        setupBackgroundGradient()
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.backgroundColor = UIColor.clear
        
        
        SpotifyWebAPIService.shared.sptUserTop(itemType: .tracks) { (tracks, _, error) in
            if let error = error {
                print("Error: ", error)
                self.checkAccessToken()
            }
            
            if let userTracks = tracks {
                self.tableView.tracks = userTracks
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        SpotifyWebAPIService.shared.sptUserTop(itemType: .artists) { (_, artists, error) in
            if let error = error {
                print("Error: ", error)
                self.checkAccessToken()
            }
            if let userArtists = artists {
                self.tableView.artists = userArtists
                
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
        layer.locations = [0.0, 0.2]
        view.layer.addSublayer(layer)
    }
    
    func showLoginFlow() {
        let logInVC = LogInViewController()
        navigationController?.pushViewController(logInVC, animated: true)
    }
    
    fileprivate func checkAccessToken() {
        SpotifyAuthService.shared.sptCheckAccessToken { [weak self] (exists, error) in
            if let error = error {
                print("Error Checking Access Token: ", error.localizedDescription)
            }
            exists ? print(exists) : self?.showLoginFlow()
        }
    }
    
    fileprivate func setupNavBar() {
        if navigationController?.navigationBar.isHidden == true {
            navigationController?.navigationBar.isHidden = false
        }
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        guard let navController = navigationController else { return }
        navController.navigationBar.addSubview(signOutButton)
        NSLayoutConstraint.activate([
            signOutButton.bottomAnchor.constraint(equalTo: navController.navigationBar.bottomAnchor, constant: 0),
            signOutButton.trailingAnchor.constraint(equalTo: navController.navigationBar.trailingAnchor, constant: -15),
            signOutButton.widthAnchor.constraint(equalToConstant: 48),
            signOutButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
}
