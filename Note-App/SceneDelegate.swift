//
//  SceneDelegate.swift
//  Note-App
//
//  Created by Chorn Thoen on 5/24/24.
//

import UIKit

var isLogin = "isLogin"

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        window.tintColor = .black
        
        
        if !UserDefaults.standard.bool(forKey: "isLogin") {
            let loginViewController = LoginViewController()
            window.rootViewController = UINavigationController(rootViewController: loginViewController)
            
        }
        else {
            window.rootViewController = TabBarViewController()
        }
       
        self.window = window
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
