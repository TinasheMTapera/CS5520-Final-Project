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
        
        title = "Welcome \(currentUser?.displayName ?? "Anonymous")!"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupNavBar()
        setupUserHomeViewButtons()
        
    }
    
    func setupNavBar() {
        
        let menuButton = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal"),
            style: .plain,
            target: self,
            action: #selector(menuButtonTapped)
        )
        
        navigationItem.leftBarButtonItem = menuButton
        self.setupLogoInNavBar(in: self.navigationItem)
    }
    
    
    @objc func menuButtonTapped() {
        print("menu button tapped")
        
        let alertController = UIAlertController(title: "Menu", message: nil, preferredStyle: .actionSheet)
        
        // Add your menu options as actions
        let viewProfileAction = UIAlertAction(title: "View Profile", style: .default) { _ in
            self.profileButtonTapped()
        }
        let viewAboutAction = UIAlertAction(title: "About MoodMaster", style: .default) { _ in
            self.aboutButtonTapped()
        }
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { _ in
            self.attemptUserLogout()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(viewProfileAction)
        alertController.addAction(viewAboutAction)
        alertController.addAction(logoutAction)
        alertController.addAction(cancelAction)
        
        // Present the UIAlertController on iPhone or show it in a popover on iPad
        if let popoverController = alertController.popoverPresentationController {
            popoverController.barButtonItem = navigationItem.leftBarButtonItem
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func profileButtonTapped() {
        
    }
    
    func aboutButtonTapped() {
        
    }
    
    func attemptUserLogout() {
        
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
