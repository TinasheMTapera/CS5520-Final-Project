//
//  OptionViewController.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.
//

import UIKit
import FirebaseAuth

class UserHomeViewController: UIViewController {
    
    let userHomeView = UserHomeView()
    var currentUser = Auth.auth().currentUser
    
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = userHomeView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(self, selector: #selector(userNameUpdated), name: NSNotification.Name(rawValue: "userRegistered"), object: nil)
        
        print("user at viewDidload -- \(currentUser?.displayName)")
        
        title = "Hello \(currentUser?.displayName ?? "Anonymous")!"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupNavBar()
        setupUserHomeViewButtons()
        
        userHomeView.logoutButton.addTarget(self, action: #selector(attemptUserLogout), for: .touchUpInside)
        
    }
    
    @objc func userNameUpdated() {
        
        self.currentUser = Auth.auth().currentUser
        print("Current user updated -- \(self.currentUser?.displayName)")
        
        self.title = "Hello \(currentUser?.displayName ?? "Anonymous")!"
    }
    
    func setupNavBar() {
        
        self.setupProfileIconInNavBar(in: self.navigationItem)
        self.setupLogoInNavBar(in: self.navigationItem)
    }
    
    @objc func profileButtonTapped() {
        print("Profile Button Tapped")
        
        //push profile view
        let userProfileController = ProfileScreenViewController()
        userProfileController.currentUser = self.currentUser
        navigationController?.pushViewController(userProfileController, animated: true)
    }
    
    @objc func aboutButtonTapped() {
        print("About Button Tapped")
        
        //push about view
        let aboutController = AboutScreenViewController()
        navigationController?.pushViewController(aboutController, animated: true)
    }
    
    @objc func attemptUserLogout() {
        
        let logoutAlert = UIAlertController(title: "Logging Out", message: "Are you sure you want to logout?", preferredStyle: .alert)
        logoutAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(_) in
            do {
                try Auth.auth().signOut()
                let loginController = ViewController()
                self.navigationController?.setViewControllers([loginController], animated: true)
            }
            catch {
                print("Error while signing out")
            }
        }))
        
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(logoutAlert, animated: true)
    }
    
}
