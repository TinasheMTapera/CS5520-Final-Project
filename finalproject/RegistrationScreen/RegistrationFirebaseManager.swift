//
//  RegistrationFirebaseManager.swift
//  finalproject
//
//  Created by Diya on 11/29/23.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseStorage
import CryptoKit

extension RegistrationViewController {
    
    func uploadProfilePhotoToStorage(_ name: String, _ email: String, _ password: String){
        
        var profilePhotoURL:URL?
        
        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage{
            if let jpegData = image.jpegData(compressionQuality: 80){
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child(FirebaseConfigs.listOfProfilePictures)
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                
                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil{
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                profilePhotoURL = url
                                self.registerNewAccount(name, email, password, profilePhotoURL)
                            }
                        })
                    }
                })
            }
        }else{
            registerNewAccount(name, email, password, profilePhotoURL)
        }
    }
    
    func registerNewAccount(_ name: String, _ email: String, _ password: String, _ photoURL: URL?) {
        
        print("registerNewAccount")
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
            
            if error == nil {
                
                self.currentUser = result?.user
                let userID = self.currentUser!.uid
                
                //update userName
                self.setUserNameAndPhotoOfUserInFirebaseAuth(name: name, email: email, photoURL: photoURL)
            }
            else {
                print(error)
                self.showErrorAlert(message: (error?.localizedDescription.description)!)
            }
        })
    }
    
    func setUserNameAndPhotoOfUserInFirebaseAuth(name: String, email: String, photoURL: URL?) {
        
        print("setting username and photo")
        
        showActivityIndicator()
        
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.photoURL = photoURL
        
        changeRequest?.commitChanges(completion: {(error) in
            
            if error == nil {
                
                //notify userhomescreen --
                self.notificationCenter.post(name: NSNotification.Name(rawValue: "userRegistered"), object: nil)
                
                self.createFirestoreUserDocument(photoURL: photoURL)
            }
            else {
                print(error)
                self.showErrorAlert(message: (error?.localizedDescription.description)!)
            }
        })
    }
    
    func createFirestoreUserDocument(photoURL: URL?) {
        
        print("creating firestore user document")
        
        var userCollectionCount = -1
        
        print(photoURL)
        
        if let userEmail = currentUser?.email{
            
            print("creating userdata")
            var data: [String: Any] = [
                "name": currentUser?.displayName ?? "",
                "email": userEmail
            ]

            if let profileURL = photoURL {
                // The profilePictureURL is not nil, include it in the data dictionary
                data["profilePictureURL"] = profileURL.absoluteString
            } else {
                // The profilePictureURL is nil
                data["profilePictureURL"] = ""
            }
            
            let userCollection = database.collection("users")
            
            userCollection.document(userEmail).setData(data) { error in
                
                if let error = error {
                    print("Error creating userCollection: \(error.localizedDescription)")
                } else {
                    print("userCollection created successfully")
                    
                    //fetch userCollectionCount after creating the "users" collection
                    userCollection.getDocuments { (querySnapshot, error) in
                        if let error = error {
                            print("Error fetching userCollection documents: \(error.localizedDescription)")
                        } else {
                            userCollectionCount = querySnapshot?.documents.count ?? 0
                            print("No. of documents in users collection: \(userCollectionCount)")
                            
                            //checking number of users in userCollection
                            if userCollectionCount > 1 {
                                
                                //fetch emails of users in userCollection
                                var userEmailList = querySnapshot?.documents.compactMap { document in
                                    document.data()["email"] as? String
                                } ?? []
                            }
                        }
                    }
                }
            }
            
            hideActivityIndicator()
        }
        else {
            print("failed to convert url to string")
        }
    }
    
    func userLogout() {
        
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("Error signing out!")
        }
    }
    
    func showAccountCreationAlert() {
        
        let alert = UIAlertController(title: "Success", message: "Successfully created account. Please login", preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
