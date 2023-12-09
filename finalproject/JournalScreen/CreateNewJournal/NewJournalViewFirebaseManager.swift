//
//  NewJournalViewFirebaseManager.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import Foundation

extension NewJournalViewController {
    
    @objc func createNewJournal() {
        
        print("Entered createNewJournal")
        
        if let userEmail = self.currentUser?.email{
            if let uwTitle = newJournalView.journalTitleTextField.text,
               let uwContent = newJournalView.journalTextView.text {
                
                //fetching collection
                let journalCollection = database
                    .collection(FirebaseConfigs.listOfUsers)
                    .document(userEmail)
                    .collection(FirebaseConfigs.listOfUserJournals)
                
                let newJournalDocumentRef = journalCollection.document()
                let newJournalDocumentID = newJournalDocumentRef.documentID
                
                let journalData = ["title": uwTitle, "content": uwContent, "timestamp": Date()] as [String : Any]
                
                //fetch docs
                journalCollection.getDocuments(completion: { (querySnapshot, error) in
                    
                    if error == nil {
                        
                        journalCollection.document(newJournalDocumentID).setData(journalData) { error in
                            
                            if error == nil {
                                print("New journal added successfully")
                                
                                if let journalMainController = self.navigationController?.viewControllers.first(where: { $0 is JournalMainViewController }) as? JournalMainViewController {
                                    
                                    //updating data using existing instance
                                    journalMainController.currentUser = self.currentUser
                                    journalMainController.fetchUserJournalList()
                                }
                                
                                self.navigationController?.popViewController(animated: true)
                                self.showJournalCreationAlert(message: "Created new Journal \(uwTitle)")
                            }
                            else {
                                print("Failed to create new journal")
                            }
                        }
                        
                    }
                    else {
                        print("Failed to add new journal to the journalCollection")
                    }
                    
                })
            }
        }
        else {
            print("Current user email is nil")
        }
        
        print("Exiting createNewJournal")
    }
    
    @objc func updateJournal(journalID: String) {
        
        print("Entered updateJournal")
        
        if let userEmail = self.currentUser?.email{
            
            if let uwTitle = newJournalView.journalTitleTextField.text,
               let uwContent = newJournalView.journalTextView.text {
                
                //fetching collection
                let journalDoc = database
                    .collection(FirebaseConfigs.listOfUsers)
                    .document(userEmail)
                    .collection(FirebaseConfigs.listOfUserJournals)
                    .document(journalID)
                
                let updatedJournalData = ["title": uwTitle, "content": uwContent, "timestamp": Date()] as [String: Any]
                
                //updating data in doc
                journalDoc.updateData(updatedJournalData) { error in
                    
                    if error == nil {
                        print("Succesfully updated specific journal document")
                        
                        if let journalMainController = self.navigationController?.viewControllers.first(where: { $0 is JournalMainViewController }) as? JournalMainViewController {
                            
                            //updating data using existing instance
                            journalMainController.currentUser = self.currentUser
                            journalMainController.fetchUserJournalList()
                        }
                        
                        self.navigationController?.popViewController(animated: true)
                        self.showJournalCreationAlert(message: "Updated Journal \(uwTitle)")
                    }
                    else{
                        print("Failed to update specific journal document")
                    }
                    
                }
                
            }
        }
        else {
            print("Current user email is nil")
        }
        
        print("Exiting updateJournal")
    }
    
}
