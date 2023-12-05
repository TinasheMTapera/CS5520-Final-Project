//
//  LoginFirebaseManager.swift
//  MoodMaster
//
//  Created by Diya on 11/29/23.
//

import Foundation
import FirebaseAuth

extension ViewController {
    
    func signInToFirebase(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (result, error) in
            
            if error == nil {
                print("user authenticated")
//                let userHomeController = UserHomeViewController(currentUser: self.currentUser)
            }
            else {
                print(error)
                self.showErrorAlert(message: "Invalid Username or Password. Please try again")
            }
        })
    }
}

