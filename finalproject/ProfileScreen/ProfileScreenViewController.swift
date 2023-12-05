//
//  ProfileScreenViewController.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class ProfileScreenViewController: UIViewController {
    
    let userProfileView = ProfileScreenView()
    
    var currentUser: FirebaseAuth.User?
    let database = Firestore.firestore()
    
    override func loadView() {
        view = userProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        
        fetchUserDetailsFromFirebase()
        
        print(self.currentUser?.photoURL)
        if let url = self.currentUser?.photoURL{
            userProfileView.profileImage.loadRemoteImage(from: url)
        }
        
    }
    
    func setUserDisplayData(userDetails: UserDetails) {
        
        print("Entered setUserDisplayData")
        
        userProfileView.nameLabel.text = "Name: \(userDetails.name)"
        userProfileView.emailLabel.text = "Email: \(userDetails.email)"
    }
    
}

