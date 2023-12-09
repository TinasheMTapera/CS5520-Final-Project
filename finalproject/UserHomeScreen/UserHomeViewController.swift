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
        
        //notification for when a user has registered
        notificationCenter.addObserver(self, selector: #selector(userNameUpdated), name: NSNotification.Name(rawValue: "userRegistered"), object: nil)
        
        //setting navBar title and tiles
        title = "Hello \(currentUser?.displayName ?? "Anonymous")!"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //default function calls when the view loads
        setupNavBar()
        setupUserHomeViewButtons()
        
        //setting view button targets
        userHomeView.logoutButton.addTarget(self, action: #selector(attemptUserLogout), for: .touchUpInside)
        
    }
    
    @objc func userNameUpdated() {
        
        self.currentUser = Auth.auth().currentUser
        self.title = "Hello \(currentUser?.displayName ?? "Anonymous")!"
    }
    
    func setupNavBar() {
        
        print("Entered setupNavBar")
        
        self.setupProfileIconInNavBar(in: self.navigationItem)
        self.setupLogoInNavBar(in: self.navigationItem)
        
        print("Exiting setupNavBar")
    }
    
    @objc func profileButtonTapped() {
        
        print("Entered profileButtonTapped")
        
        let userProfileController = ProfileScreenViewController()
        userProfileController.currentUser = self.currentUser
        navigationController?.pushViewController(userProfileController, animated: true)
        
        print("Exiting profileButtonTapped")
    }
    
    @objc func aboutButtonTapped() {
        
        print("Entered aboutButtonTapped")
        
        let aboutController = AboutScreenViewController()
        navigationController?.pushViewController(aboutController, animated: true)
        
        print("Exiting aboutButtonTapped")
    }
    
    @objc func attemptUserLogout() {
        
        print("Entered attemptUserLogout")
        
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
        
        print("Exiting attemptUserLogout")
    }
    
}
