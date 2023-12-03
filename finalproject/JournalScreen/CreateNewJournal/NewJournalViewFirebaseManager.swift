//
//  NewJournalViewFirebaseManager.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import Foundation

extension NewJournalViewController {
    
    @objc func postNewJournal() {
        
        if let userEmail = self.currentUser?.email{
            if let uwTitle = newJournalView.journalTitleTextField.text,
               let uwContent = newJournalView.journalTextView.text {
                
                let journalCollection = database.collection("users").document(userEmail).collection("journalCollection")
                let newJournalDocumentRef = journalCollection.document()
                let newJournalDocumentID = newJournalDocumentRef.documentID
                
                let journalData = ["title": uwTitle, "content": uwContent, "timestamp": Date()] as [String : Any]
                
                journalCollection.getDocuments(completion: { (querySnapshot, error) in
                    
                    if error == nil {
                        
                        print("New journal ID -- \(newJournalDocumentID)")
                        
                        journalCollection.document(newJournalDocumentID).setData(journalData) { error in
                            if error == nil {
                                print("New journal added successfully")
                                self.showJournalCreationAlert(message: "Created new Journal \(uwTitle)")
                                self.navigationController?.popViewController(animated: true)
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
    }
}
