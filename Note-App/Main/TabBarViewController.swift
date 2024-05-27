//
//  TabBarViewController.swift
//  Note-App
//
//  Created by Chorn Thoen on 5/25/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .white
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let folderViewController = FolderViewController()
        folderViewController.title = "Folders"
        folderViewController.tabBarItem = UITabBarItem(title: "Folder", image: UIImage(systemName: "folder"), tag: 0)
        let homeNavController = UINavigationController(rootViewController: folderViewController)
        homeNavController.tabBarItem.selectedImage = UIImage(systemName: "folder.fill")
        
        
        let profileViewController = SettingViewController()
        profileViewController.title = "Setting"
        profileViewController.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gearshape"), tag: 1)
        profileViewController.tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")
        let profileNavController = UINavigationController(rootViewController: profileViewController)
        
        self.viewControllers = [homeNavController, profileNavController]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

