//
//  ViewController.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    let loginView = LoginView()
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser: FirebaseAuth.User?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("View will appear")
        
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            
            print("user -- \(user)")
            
            if user == nil {
                
                //user not signed in functionality
                
                self.showLoginScreen()
//                self.currentUser = nil
//                self.navigationController?.pushViewController(self.loginController, animated: true)
//                self.loginView.loginButton.isEnabled  = true
//                self.loginView.registerButton.isEnabled = true
                
//                self.userMessageView.messageLabel.text = "Please sign in to view your inbox"
//
//                self.messageList.removeAll()
//                self.userMessageView.tableViewMessages.reloadData()
//                self.userMessageView.newMessageFloatingButton.isHidden = true
//                self.setupRightBarButton(isLoggedIn: false)
            }
            else {
                
                //user signed in functionality
                
                self.showUserHomeScreen()
//                self.currentUser = user
//                self.view = self.userHomeView
//                self.fetchUserMessagesAtLogin()
//                self.userMessageView.messageLabel.text = "Welcome \(user?.displayName ?? "Anonymous")!"
//                self.userMessageView.newMessageFloatingButton.isEnabled = true
//                self.userMessageView.newMessageFloatingButton.isHidden = false
//                self.setupRightBarButton(isLoggedIn: true)
            }
        }
    }
    
    func showLoginScreen() {
        
        view = loginView
    }
    
    func showUserHomeScreen() {
        let userHomeController = UserHomeViewController()
        navigationController?.setViewControllers([userHomeController], animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up action for the register button in MainView
        loginView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    @objc private func registerButtonTapped() {
        // Instantiate RegistrationViewController
        print("Register button tapped")

        // Check if navigationController exists and the stack is not empty
        guard let navigationController = navigationController, !navigationController.viewControllers.isEmpty else {
            print("Navigation controller is nil or stack is empty")
            return
        }
        let registrationVC = RegistrationViewController()

        // Push RegistrationViewController to the navigation stack
        navigationController.pushViewController(registrationVC, animated: true)
    }
    
    @objc private func loginButtonTapped() {
        // Instantiate OptionViewController
        print("Login button tapped")

        // Check if navigationController exists
        guard let navigationController = navigationController else {
            print("Navigation controller is nil")
            return
        }

        // Pop the current view controller from the navigation stack
        navigationController.popViewController(animated: true)

        // Instantiate and push OptionViewController to the navigation stack
        let optionVC = UserHomeViewController()
        navigationController.pushViewController(optionVC, animated: true)
    }

}


