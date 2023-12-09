//
//  LoginFirebaseManager.swift
//  MoodMaster
//
//  Created by Diya on 11/29/23.
//

import Foundation
import FirebaseAuth

extension ViewController {
    
    //signIn user
    func signInToFirebase(email: String, password: String) {
        
        print("Entered signInToFirebase")
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (result, error) in
            
            if error == nil {
                print("User Authenticated successfully")
            }
            else {
                print(error)
                self.showErrorAlert(message: "Invalid Username or Password. Please try again")
            }
        })
        
        print("Exiting signInToFirebase")
    }
}

