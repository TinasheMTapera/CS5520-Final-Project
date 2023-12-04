//
//  NewJournalViewController.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class NewJournalViewController: UIViewController {
    
    let newJournalView = NewJournalView()
    
    var currentUser: FirebaseAuth.User?
    let database = Firestore.firestore()
    
    var currentAction: JournalAction = .create
    
    override func loadView() {
        view = newJournalView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        
    }
    
    func showJournalCreationAlert(message: String) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    @objc func doneButtonTapped() {
        
        if case let .edit(journalID) = currentAction {
            
            // Call the update function with the journalID
            updateJournal(journalID: journalID)
            
            
        } else {
            
            // Handle the action for creating a new journal
            createNewJournal()
        }
        
    }
    
}
