//
//  HomeViewController.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/4/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
import SpotifyLogin

class HomeViewController: UIViewController, ItemsViewModelDelegate {
    
    // MARK: - View Model
    var itemsViewModel = ItemsViewModel(sptWebAPIService: SpotifyWebAPIService(networkService: NetworkService()))
    
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
        tv.delegate = self
        tv.dataSource = self
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
        
        itemsViewModel.delegate = self
        
        itemsViewModel.getTracks()
        itemsViewModel.getArtists()
        
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
        
        checkAccessToken()
        
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
        let sptAuthService = SpotifyAuthService()
        sptAuthService.sptCheckAccessToken { [weak self] (exists, token , error) in
            if let error = error {
                print("Error Checking Access Token: ", error.localizedDescription)
            }
            print(token ?? "")
            exists ? print(exists) : self?.showLoginFlow()
        }
    }
    
    /// Set up the navigation bar with a clear background and shadows. Add the sign out button as a navigation bar sub view
    func setupNavBar() {
        // make nav bar visible if hidden
        guard let navBar = navigationController?.navigationBar else { return }
        if navBar.isHidden == true {
            navBar.isHidden = false
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

// MARK:- Table View delegate and data source methods
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsViewModel.tracks.count + itemsViewModel.artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Common.gridItemReuseIdentifier, for: indexPath) as! GridTableViewCell
            cell.sectionLabel.text = "Good evening"
            cell.gridCollectionView.tracks = Array<Track>(itemsViewModel.tracks.prefix(6))
            return cell
        case 1:
            let cell = ItemTableViewCell.init(style: .default, reuseIdentifier: Common.itemReuseIdentifier)
            cell.cellType = .small
            cell.backgroundColor = .red
            cell.sectionLabel.text = "Your top tracks"
            cell.itemCollectionView.tracks = itemsViewModel.tracks
            return cell
        case 2:
            let cell = ItemTableViewCell.init(style: .default, reuseIdentifier: Common.itemReuseIdentifier)
            cell.sectionLabel.text = "Your top artists"
            cell.itemCollectionView.artists = itemsViewModel.artists
            return cell
        default:
            let cell = ItemTableViewCell.init(style: .default, reuseIdentifier: Common.itemReuseIdentifier)
            cell.sectionLabel.text = "Your top tracks"
            cell.itemCollectionView.tracks = itemsViewModel.tracks
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return SPTHomeSectionHeight.grid.value
        case 1:
            return SPTHomeSectionHeight.itemSmall.value
        default:
            return SPTHomeSectionHeight.itemRegular.value
        }

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
    }
    
}

// MARK: - View model delegate method
extension HomeViewController {
    /// Reload table view when track or artist data is received.
    func didReceiveItemData() {
        self.tableView.reloadData()
    }
    
    /// Print the error received when fetching data from view model fails.
    /// - Parameter error: Error object returned from the SpotfyWebAPIService.
    func didFailReceivingData(with error: Error) {
        print("Failed to fetch data from view model:", error)
    }
}


