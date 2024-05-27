////
////  LoginViewController.swift
////  Note-App
////
////  Created by Chorn Thoen on 5/24/24.
//
//
//
//import UIKit
//
//class LoginViewController: UIViewController {
//    
//    let scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        return scrollView
//    }()
//    
//    let containerView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "logo")
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//    
//    let welcomeText: UILabel = {
//        let label = UILabel()
//        label.text = "LOGIN"
//        label.font = UIFont.boldSystemFont(ofSize: 24)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    let userNameTF: UITextField = {
//        let tf = UITextField()
//        tf.placeholder = "Username"
//        tf.borderStyle = .roundedRect
//        tf.layer.cornerRadius = 6
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.heightAnchor.constraint(equalToConstant: 46).isActive = true
//        return tf
//    }()
//    
//    let passwordTF: UITextField = {
//        let tf = UITextField()
//        tf.placeholder = "Password"
//        tf.borderStyle = .roundedRect
//        tf.layer.cornerRadius = 6
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.heightAnchor.constraint(equalToConstant: 46).isActive = true
//        tf.isSecureTextEntry = true
//        return tf
//    }()
//    
//    let btnLogin: UIButton = {
//        let btn = UIButton()
//        btn.setTitle("Login", for: .normal)
//        btn.backgroundColor = .black
//        btn.layer.cornerRadius = 6
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.heightAnchor.constraint(equalToConstant: 46).isActive = true
//        return btn
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .systemBackground
//
//        btnLogin.addTarget(self, action: #selector(submitLogin), for: .touchUpInside)
//        setUpKeyBoardEvent()
//        addSubViewToScrollView()
//        setUpConstraint()
//    }
//    
//    @objc func submitLogin() {
//        if userNameTF.text?.capitalized == "Aditi" ||
//            userNameTF.text?.capitalized == "Admin" &&
//            passwordTF.text == "2024" {
//            navigateToHomeScreen()
//        } else if  userNameTF.text?.capitalized == "" || passwordTF.text == "" {
//            messageAlert(
//                title: "Login failed!",
//                message: "Please enter username and password"
//            )
//        } else {
//            messageAlert(
//                title: "Login failed!",
//                message: "Invalid username or password"
//            )
//        }
//    }
//    func messageAlert(title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//        present(alert, animated: true)
//    }
//    
//    private func navigateToHomeScreen() {
//        UserDefaults.standard.set(userNameTF.text, forKey: "username")
//        UserDefaults.standard.set(true, forKey: "isLogin")
//        
//        let mainViewController = TabBarViewController()
//        self.navigationController?.pushViewController(mainViewController, animated: true)
//    }
//    
//    func setUpKeyBoardEvent() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        view.addGestureRecognizer(tap)
//    }
//    
//    @objc func keyboardWillShow(notification: Notification) {
//        let userInfo = notification.userInfo
//        let keyboardSize = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
//        let keyboardFrame = keyboardSize.cgRectValue
//        let keyboardHeight = keyboardFrame.height
//        
//        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
//        scrollView.contentInset = contentInset
//        view.layoutIfNeeded()
//    }
//    
//    @objc func keyboardWillHide(notification: Notification) {
//        scrollView.contentInset = .zero
//        view.layoutIfNeeded()
//    }
//    
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//    
//    func addSubViewToScrollView() {
//        view.addSubview(scrollView)
//        
//        scrollView.addSubview(containerView)
//        containerView.addSubview(imageView)
//        containerView.addSubview(welcomeText)
//        containerView.addSubview(userNameTF)
//        containerView.addSubview(passwordTF)
//        containerView.addSubview(btnLogin)
//    }
//    
//    func setUpConstraint() {
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//
//            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            
//            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
//            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            imageView.widthAnchor.constraint(equalToConstant: 200),
//            imageView.heightAnchor.constraint(equalToConstant: 150),
//            
//            welcomeText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
//            welcomeText.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            welcomeText.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            
//            userNameTF.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 20),
//            userNameTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            userNameTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            
//            passwordTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 20),
//            passwordTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            passwordTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            
//            btnLogin.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20),
//            btnLogin.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            btnLogin.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            btnLogin.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
//        ])
//    }
//}


//
//  LoginViewController.swift
//  Note-App
//
//  Created by Chorn Thoen on 5/24/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let welcomeText: UILabel = {
        let label = UILabel()
        label.text = "LOGIN"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userNameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 6
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return tf
    }()
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 6
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.heightAnchor.constraint(equalToConstant: 46).isActive = true
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let btnLogin: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 6
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return btn
    }()
    
    let passwordToggleBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        btn.tintColor = .gray
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        btnLogin.addTarget(self, action: #selector(submitLogin), for: .touchUpInside)
        passwordToggleBtn.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        setUpKeyBoardEvent()
        addSubViewToScrollView()
        setUpConstraint()
        setupPasswordToggle()
    }
    
    @objc func submitLogin() {
        if userNameTF.text?.capitalized == "Aditi" ||
            userNameTF.text?.capitalized == "Admin" &&
            passwordTF.text == "2024" {
            navigateToHomeScreen()
        } else if  userNameTF.text?.capitalized == "" || passwordTF.text == "" {
            messageAlert(
                title: "Login failed!",
                message: "Please enter username and password"
            )
        } else {
            messageAlert(
                title: "Login failed!",
                message: "Invalid username or password"
            )
        }
    }
    
    func messageAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    private func navigateToHomeScreen() {
        UserDefaults.standard.set(userNameTF.text, forKey: "username")
        UserDefaults.standard.set(true, forKey: "isLogin")
        
        let mainViewController = TabBarViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    func setUpKeyBoardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        let keyboardFrame = keyboardSize.cgRectValue
        let keyboardHeight = keyboardFrame.height
        
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = contentInset
        view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = .zero
        view.layoutIfNeeded()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func togglePasswordVisibility() {
        passwordTF.isSecureTextEntry.toggle()
        let imageName = passwordTF.isSecureTextEntry ? "eye.fill" : "eye.slash.fill"
        passwordToggleBtn.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func addSubViewToScrollView() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(welcomeText)
        containerView.addSubview(userNameTF)
        containerView.addSubview(passwordTF)
        containerView.addSubview(btnLogin)
        containerView.addSubview(passwordToggleBtn)
    }
    
    func setUpConstraint() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            welcomeText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
            welcomeText.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            welcomeText.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            userNameTF.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 20),
            userNameTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            userNameTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            passwordTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 20),
            passwordTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            passwordTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            passwordToggleBtn.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor, constant: -8),
            passwordToggleBtn.centerYAnchor.constraint(equalTo: passwordTF.centerYAnchor),
            passwordToggleBtn.widthAnchor.constraint(equalToConstant: 30),
            passwordToggleBtn.heightAnchor.constraint(equalToConstant: 30),
            
            btnLogin.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20),
            btnLogin.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            btnLogin.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            btnLogin.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupPasswordToggle() {
        passwordTF.rightView = passwordToggleBtn
        passwordTF.rightViewMode = .always
    }
}
