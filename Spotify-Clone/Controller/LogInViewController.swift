//
//  LoginViewController.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/3/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
import SpotifyLogin

/// Log in screen view controller
class LogInViewController: UIViewController {

    private lazy var loginButton: SpotifyLoginButton = {
        let button = SpotifyLoginButton(viewController: self,
        scopes: [.streaming,
                 .userReadTop,
                 .playlistReadPrivate,
                 .userLibraryRead,
                 .userReadEmail])
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        
        
        self.view.addSubview(loginButton)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(loginSuccessful),
                                               name: .SpotifyLoginSuccessful,
                                               object: nil)
        
        
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        loginButton.center = self.view.center
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    /// Pop the log in view controller from the navigation stack.
    @objc func loginSuccessful() {
        self.navigationController?.popViewController(animated: true)
    }
}

