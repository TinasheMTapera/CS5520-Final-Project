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
        
        //checking auth status - is user logged in?
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            
            if user == nil {
                
                //user not signed in functionality
                self.view = self.loginView
            }
            else {
                
                //user signed in functionality
                self.currentUser = user
                self.showUserHomeScreen()
            }
        }
    }
    
    func showUserHomeScreen() {
        
        print("Entered showUserHomeScreen")
        
        let userHomeController = UserHomeViewController()
        userHomeController.currentUser = self.currentUser
        navigationController?.pushViewController(userHomeController, animated: true)
        
        print("Exiting showUserHomeScreen")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting bar colour to remain same as background when a user scrolls
        navigationController?.navigationBar.barTintColor = AppColors.backgroundColor
        
        //setting view button targets
        loginView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        //hide the keyboard
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc private func registerButtonTapped() {
        
        print("Entered registerButtonTapped")
        
        let registrationController = RegistrationViewController()
        navigationController?.pushViewController(registrationController, animated: true)
        
        print("Exiting registerButtonTapped")
    }
    
    @objc private func loginButtonTapped() {
        
        print("Entered loginButtonTapped")
        
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
        
        print("Exiting loginButtonTapped")
    }
    
    func showErrorAlert(message: String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)

    }
    
    //hide keyboard
    @objc func hideKeyboardOnTap() {
        
        //removing the keyboard from screen
        view.endEditing(true)
    }


}


