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
                let userHomeController = UserHomeViewController()
                print("result.user -- \(result?.user)")
                self.currentUser = result?.user
                userHomeController.currentUser = self.currentUser
//                self.navigationController?.pushViewController(userHomeController, animated: true)
            }
            else {
                print(error)
                self.showErrorAlert(message: "Invalid Username or Password. Please try again")
            }
        })
    }
}

