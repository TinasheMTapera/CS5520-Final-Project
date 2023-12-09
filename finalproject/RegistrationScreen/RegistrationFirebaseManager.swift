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
    
    //uploadProfilePhoto to firebase storage if exists
    func uploadProfilePhotoToStorage(_ name: String, _ email: String, _ password: String){
        
        print("Entering uploadProfilePhotoToStorage")
        
        //show loading symbol
        showActivityIndicator()
        
        var profilePhotoURL:URL?
        
        if let image = pickedImage{
            
            //user added a profilePicture
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
            //registerAccount without profilePicture
            registerNewAccount(name, email, password, profilePhotoURL)
        }
        
        print("Exiting uploadProfilePhotoToStorage")
    }
    
    //register user in firebase
    func registerNewAccount(_ name: String, _ email: String, _ password: String, _ photoURL: URL?) {
        
        print("Entered registerNewAccount")
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
            
            if error == nil {
                
                self.currentUser = result?.user
                let userID = self.currentUser!.uid
                
                self.setUserNameAndPhotoOfUserInFirebaseAuth(name: name, email: email, photoURL: photoURL)
            }
            else {
                print(error)
                self.showErrorAlert(message: (error?.localizedDescription.description)!)
            }
        })
        
        print("Exiting registerNewAccount")
    }
    
    //update userName and profilePhoto(if any)
    func setUserNameAndPhotoOfUserInFirebaseAuth(name: String, email: String, photoURL: URL?) {
        
        print("Entered setUserNameAndPhotoOfUserInFirebaseAuth")
        
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
        
        print("Exiting setUserNameAndPhotoOfUserInFirebaseAuth")
    }
    
    //create the user in database
    func createFirestoreUserDocument(photoURL: URL?) {
        
        print("Entered createFirestoreUserDocument")
        
        var userCollectionCount = -1
        
        if let userEmail = currentUser?.email{
            
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
            
            let userCollection = database.collection(FirebaseConfigs.listOfUsers)
            
            let userDoc = userCollection.document(userEmail)
            
            userDoc.setData(data) { error in
                
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
            
            //hide loading symbol when registration is complete
            hideActivityIndicator()
        }
        else {
            print("User email is nil")
        }
        
        print("Exiting createFirestoreUserDocument")
    }
    
    func userLogout() {
        
        print("Entered userLogout")
        
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("Error signing out!")
        }
        
        print("Exiting userLogout")
    }
    
    func showAccountCreationAlert() {
        
        let alert = UIAlertController(title: "Success", message: "Successfully created account. Please login", preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
