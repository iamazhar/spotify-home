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
    
    // MARK: - Views
    
    /// Sign out button which is available in the navigation bar
    private lazy var signOutButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage(systemName: "gear")?.tinted(with: .white), for: .normal)
        b.addTarget(self, action: #selector(handleSignOut), for: .touchUpInside)
        b.setTitleColor(UIColor.label, for: .normal)
        return b
    }()
    
    /// Handler to perform sign out.
    @objc fileprivate func handleSignOut() {
        SpotifyLogin.shared.logout()
        print("Did Sign out")
        showLoginFlow()
    }
    
    /// Primary table view to display Home content
    private lazy var tableView: HomeTableView = {
        let tv = HomeTableView(frame: .zero, style: .plain)
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    // MARK: - Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup nav bar and gradient background
        setupNavBar()
        setupBackgroundGradient()
        
        // add and constrain tableView
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // API call
        SpotifyWebAPIService.shared.sptUserTop(itemType: .tracks) { (tracks, _, error) in
            if let error = error {
                print("Error: ", error)
            }
            
            if let userTracks = tracks {
                self.tableView.tracks = userTracks
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        // API call
        SpotifyWebAPIService.shared.sptUserTop(itemType: .artists) { (_, artists, error) in
            if let error = error {
                print("Error: ", error)
            }
            if let userArtists = artists {
                self.tableView.artists = userArtists
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    /// Sets up the background gradient with design tokens from the Spotify Design System
    fileprivate func setupBackgroundGradient() {
        let layer = CAGradientLayer()
        layer.frame = view.frame
        layer.colors = [UIColor.homeBgGradientTop().cgColor, UIColor.homeBgGradientBottom().cgColor]
        layer.locations = [0.0, 0.2]
        view.layer.addSublayer(layer)
    }
    
    /// Presents the Log In VC based on external logic
    func showLoginFlow() {
        let logInVC = LogInViewController()
        navigationController?.pushViewController(logInVC, animated: true)
    }
    
    /// Check if the access token exists. Based on the returned boolean value the log in controller is pushed onto the navigation stack.
    fileprivate func checkAccessToken() {
        SpotifyAuthService.shared.sptCheckAccessToken { [weak self] (exists, error) in
            if let error = error {
                print("Error Checking Access Token: ", error.localizedDescription)
            }
            exists ? print(exists) : self?.showLoginFlow()
        }
    }
    
    /// Set up the navigation bar with a clear background and shadows. Add the sign out button as a navigation bar sub view
    fileprivate func setupNavBar() {
        // make nav bar visible if hidden
        if navigationController?.navigationBar.isHidden == true {
            navigationController?.navigationBar.isHidden = false
        }
        
        //style the nav bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        // add and constraint signOutButton
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
