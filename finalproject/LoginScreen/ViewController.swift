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
    let userHomeView = UserHomeView()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser: FirebaseAuth.User?
    
    
    override func loadView() {
        view = loginView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("View will appear")
        
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            
            print("user -- \(user)")
            
            if user == nil {
                
                //user not signed in functionality
                
                self.view = self.loginView
//                self.showLoginScreen()
//                self.loadView()
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
                
                self.currentUser = user
                self.showUserHomeScreen()
//                let userHomeController = UserHomeViewController()
//                userHomeController.currentUser = user
//                self.view = self.userHomeView
//                self.navigationController?.pushViewController(userHomeController, animated: true)
//                self.view = self.userHomeView
//                self.fetchUserMessagesAtLogin()
//                self.userMessageView.messageLabel.text = "Welcome \(user?.displayName ?? "Anonymous")!"
//                self.userMessageView.newMessageFloatingButton.isEnabled = true
//                self.userMessageView.newMessageFloatingButton.isHidden = false
//                self.setupRightBarButton(isLoggedIn: true)
            }
        }
    }
    
    func showUserHomeScreen() {
        
        if let viewControllers = navigationController?.viewControllers {
                for viewController in viewControllers {
                    if viewController is UserHomeViewController {
                        navigationController?.viewControllers.removeAll(where: { $0 is UserHomeViewController })
                        break
                    }
                }
            }

            // Push a new instance of UserHomeViewController
            let userHomeController = UserHomeViewController()
            userHomeController.currentUser = self.currentUser
            navigationController?.pushViewController(userHomeController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        //Some code to hide the keyboard
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }

    @objc private func registerButtonTapped() {
        
        // Instantiate RegistrationViewController
        print("New user registration")
        let registrationController = RegistrationViewController()
        navigationController?.pushViewController(registrationController, animated: true)
    }
    
    @objc private func loginButtonTapped() {
        
        print("User trying to login")
        
        if let email = loginView.emailTextField.text,
           let password = loginView.passwordTextField.text {
            if !email.isEmpty && !password.isEmpty {
                loginView.emailTextField.text = ""
                loginView.passwordTextField.text = ""
                signInToFirebase(email: email, password: password)
            }
            else {
                showErrorAlert(message: "Please enter valid credentials")
            }
        }
    }
    
    func showErrorAlert(message: String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    
    //Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }


}


