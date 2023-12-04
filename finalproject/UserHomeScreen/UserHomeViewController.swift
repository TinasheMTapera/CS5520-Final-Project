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
    var currentUser: FirebaseAuth.User?
    
    override func loadView() {
        view = userHomeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(currentUser?.displayName)
        
        title = "Hello \(currentUser?.displayName ?? "Anonymous")!"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupNavBar()
        setupUserHomeViewButtons()
        
        userHomeView.logoutButton.addTarget(self, action: #selector(attemptUserLogout), for: .touchUpInside)
        
    }
    
    func setupNavBar() {
        
        let profileButton = UIBarButtonItem(
            image: UIImage(systemName: "person.fill"),
            style: .plain,
            target: self,
            action: #selector(profileButtonTapped)
        )
        
        navigationItem.leftBarButtonItem = profileButton
        self.setupLogoInNavBar(in: self.navigationItem)
    }
    
    @objc func profileButtonTapped() {
        print("Profile Button Tapped")
        //push profile view
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
