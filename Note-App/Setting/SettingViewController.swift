//
//  SettingViewController.swift
//  Note-App
//
//  Created by Chorn Thoen on 5/24/24.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemGray6
        self.title = "Setting"
        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = nil
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(alertLogout))
        self.navigationItem.rightBarButtonItem?.tintColor = .red
        setUpUI()
        showUserName()
    }
    func showUserName() {
        
            if let username = UserDefaults.standard.string(forKey: "username") {
                let nameLabel = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 50))
                nameLabel.text = "Hello, \(username)"
                nameLabel.textAlignment = .center
                view.addSubview(nameLabel)
            }
        }
    func setUpUI() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = self.view.center
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(alertLogout), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func logoutButtonTapped() {
        
        UserDefaults.standard.set(false, forKey: "isLogin")
        
        let loginViewController = LoginViewController()
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UINavigationController(rootViewController: loginViewController)
            window.makeKeyAndVisible()
        }
    }
    
    @objc func alertLogout() {
        let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.logoutButtonTapped()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }

    
    

}
