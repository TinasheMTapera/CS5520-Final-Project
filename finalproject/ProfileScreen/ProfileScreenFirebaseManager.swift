//
//  ProfileScreenFirebaseManager.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import Foundation

extension ProfileScreenViewController {
    
    func fetchUserDetailsFromFirebase() {
        
        print("Entered fetchUserDetailsFromFirebase")
        
        if let userEmail = self.currentUser?.email {
            
            let userCollection = database.collection(FirebaseConfigs.listOfUsers)
            let userSpecificData = userCollection.document(userEmail)
            
            //fetch count of userJournals
            fetchJournalCount(userEmail: userEmail) { journalCount in
                
                userSpecificData.getDocument { [self] (documentSnapshot, error) in
                    if let error = error {
                        print("Failed to fetch userSpecificData: \(error.localizedDescription)")
                        return
                    }
                    
                    //fetch count of userAudios
                    fetchAudioCount(userEmail: userEmail) { audioCount in
                        
                        if let userDocData = documentSnapshot?.data(), let userName = userDocData["name"] as? String {
                            let userDetails = UserDetails(name: userName, email: userEmail, journalCount: journalCount, audioCount: audioCount)
                            print("UserDetails -- \(userDetails.name), \(userDetails.email), \(userDetails.journalCount)")
                            self.setUserDisplayData(userDetails: userDetails)
                        }
                        
                    }
                }
            }
        } else {
            print("Current user email is nil")
        }
        
        print("Exiting fetchUserDetailsFromFirebase")
    }
    
    func fetchJournalCount(userEmail: String, completion: @escaping (Int) -> Void) {
        
        print("Entered fetchJournalCount")
        
        let userCollection = database.collection(FirebaseConfigs.listOfUsers)
        let userSpecificData = userCollection.document(userEmail)
        let journalCollection = userSpecificData.collection("journals")
        
        //fetch docs
        journalCollection.getDocuments { (querySnapshot, error) in
            
            if let error = error {
                print("Error fetching documents from 'journals' subcollection: \(error.localizedDescription)")
                completion(0)
                return
            }
            
            if let documents = querySnapshot?.documents {
                
                //access docs
                print("Number of documents in 'journals' subcollection: \(documents.count)")
                completion(documents.count)
            } else {
                
                //collection does not exist
                print("No documents found in 'journals' subcollection.")
                completion(0)
            }
        }
        
        print("Exiting fetchJournalCount")
    }
    
    func fetchAudioCount(userEmail: String, completion: @escaping (Int) -> Void) {
        
        print("Entered fetchAudioCount")
        
        let storageRef = storageRef.child(FirebaseConfigs.listOfAudioRecordings).child(userEmail)
        
        //fetch all audios from storage
        storageRef.listAll { (result, error) in
            
            if let error = error {
                print("Error fetching audio recordings: \(error.localizedDescription)")
                completion(0)
                return
            }
            
            if let userRecordings = result {
                completion(userRecordings.items.count)
            } else {
                completion(0)
            }
        }
        
        print("Exiting fetchAudioCount")
    }
}
