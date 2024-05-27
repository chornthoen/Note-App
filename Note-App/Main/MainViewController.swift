////
////  MainViewController.swift
////  Note-App
////
////  Created by Chorn Thoen on 5/24/24.
////
//
//import UIKit
//
//class MainViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupTabBar()
//        view.backgroundColor = .systemGray6
//        
//    }
//    private func setupTabBar() {
//        let homeViewController = FolderViewController()
//        homeViewController.title = "Folder"
//        homeViewController.tabBarItem = UITabBarItem(title: "Folder", image: UIImage(systemName: "folder"), tag: 0)
//        
//        let profileViewController = SettingViewController()
//        profileViewController.title = "Setting"
//        profileViewController.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gear"), tag: 1)
//        
//        let tabBarViewController = UITabBarController()
//        tabBarViewController.tabBar.backgroundColor = .white
//        tabBarViewController.viewControllers = [homeViewController, profileViewController]
//        
//        addChild(tabBarViewController)
//        view.addSubview(tabBarViewController.view)
//        tabBarViewController.didMove(toParent: self)
//    }
//    
//
//}

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        view.backgroundColor = .systemGray6
        
        // Hide the back button
        navigationItem.hidesBackButton = true
//        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = nil
        self.navigationItem.leftBarButtonItem = nil
    
    }
    
    private func setupTabBar() {
        let homeViewController = FolderViewController()
        homeViewController.title = "Folder"
        homeViewController.tabBarItem = UITabBarItem(title: "Folder", image: UIImage(systemName: "folder"), tag: 0)
        
        let profileViewController = SettingViewController()
        profileViewController.title = "Setting"
        profileViewController.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gear"), tag: 1)
        
        let tabBarViewController = UITabBarController()
        tabBarViewController.tabBar.backgroundColor = .white
        tabBarViewController.viewControllers = [homeViewController, profileViewController]
        
        addChild(tabBarViewController)
        view.addSubview(tabBarViewController.view)
        tabBarViewController.didMove(toParent: self)
    }
}

