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
        
        //navBar right button config
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        
        //hide the keyboard
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
    }
    
    func showJournalCreationAlert(message: String) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    //hide Keyboard
    @objc func hideKeyboardOnTap(){
        //removing the keyboard from screen
        view.endEditing(true)
    }
    
    //checking
    @objc func doneButtonTapped() {
        
        if case let .edit(journalID) = currentAction {
            //updating an existing journal
            updateJournal(journalID: journalID)
        } else {
            //creation of a new journal
            createNewJournal()
        }
    }
    
}
