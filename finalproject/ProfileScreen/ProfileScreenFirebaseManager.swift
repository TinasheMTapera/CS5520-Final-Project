//
//  ProfileScreenFirebaseManager.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import Foundation

extension ProfileScreenViewController {
    
    func fetchUserDetailsFromFirebase() {
        
        if let userEmail = self.currentUser?.email {
            
            let userSpecificData = database.collection("users").document(userEmail)
            
            userSpecificData.getDocument(completion: { (querySnapshot, error) in
                
                if error == nil {
                    
                    if let userDocData = querySnapshot?.data(),
                       let userName = userDocData["name"] as? String {
                        
                        let userDetails = UserDetails(name: userName, email: userEmail)
                        print("UserDetails -- \(userDetails)")
                        self.setUserDisplayData(userDetails: userDetails)
                        
                    }
                }
                else {
                    print("Failed to fetch userSpecificData")
                }
                
            })
            
        }
        else {
            print("Current user email is nil")
        }
        
    }
    
}
