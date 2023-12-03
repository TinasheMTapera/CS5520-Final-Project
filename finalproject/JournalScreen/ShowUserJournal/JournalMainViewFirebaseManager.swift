//
//  JournalMainViewFirebaseManager.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import Foundation

extension JournalMainViewController {
    
    func fetchUserJournalList() {
        
        print("fetching user journal list")
        
        self.journalList.removeAll()
        if let currentUserEmail = self.currentUser?.email {
            
            let journalCollection = database
                .collection(FirebaseConfigs.listOfUsers)
                .document(currentUserEmail)
                .collection(FirebaseConfigs.listOfUserJournals)
            
            journalCollection.getDocuments(completion: { (querySnapshot, error) in
                
                if error == nil {
                    
                    if let collectionItems = querySnapshot?.documents {
                        
                        print("fetched journalCollection docs")
                        
                        for item in collectionItems {
                            
                            let docID = item.documentID
                            print("docID -- \(docID)")
                            let documentData = item.data()
                            
                            if let journalTitle = documentData["title"] as? String,
                               let journalContent = documentData["content"] as? String{
                                
                                print("title -- \(journalTitle), content -- \(journalContent)")
                                
                                var journalData = Journal(journalID: docID, title: journalTitle, content: journalContent)
                                self.journalList.append(journalData)
                                
                                DispatchQueue.main.async {
                                    self.journalView.tableViewJournals.reloadData()
                                }
                            }
                            
                        }
                    }
                    
                }
                else{
                    print("Failed to fetch journalCollection documents")
                }
            })
        }
        else{
            print("Current user email is nil")
        }
    }
    
    func deleteJournalConfirmed(journalID: String) {
        
        if let userEmail = self.currentUser?.email {
            
            let journalDoc = database
                .collection(FirebaseConfigs.listOfUsers)
                .document(userEmail)
                .collection(FirebaseConfigs.listOfUserJournals)
                .document(journalID)
            
            journalDoc.delete { error in
                
                if let error = error {
                    
                    print("Error deleting document: \(error.localizedDescription)")
                    
                } else {
                    
                    print("Document successfully deleted")
                    self.showConfirmationAlert(message: "Successfully deleted")
                    self.fetchUserJournalList()
                }
            }
        } else {
            print("Current user email is nil")
        }
        
    }
    
}
