//
//  SceneDelegate.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/3/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit
import SpotifyLogin

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    
    var window: UIWindow?
    lazy var rootViewController = HomeViewController()
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        SpotifyAuthService.shared.sptLoginConfigure()
        
        window.rootViewController = UINavigationController(rootViewController: rootViewController)
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        //
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        //
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        
        guard let url = URLContexts.first?.url else {
            return
        }
        
        let handled = SpotifyLogin.shared.applicationOpenURL(url) { _ in }
        print(handled);
    }
    
}

