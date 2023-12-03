//
//  JournalMainViewController.swift
//  finalproject
//
//  Created by Diya on 12/2/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class JournalMainViewController: UIViewController {
    
    let journalView = JournalMainView()
    var journalList: [Journal] = []
    
    var currentUser: FirebaseAuth.User?
    let database = Firestore.firestore()
    
    override func loadView() {
        view = journalView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Journal"
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let newJournalIcon = UIImage(systemName: "square.and.pencil")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .regular))
        let newJournalBarButton = UIBarButtonItem(
            image: newJournalIcon,
            style: .plain,
            target: self,
            action: #selector(addNewJournal)
        )
        
        navigationItem.rightBarButtonItem = newJournalBarButton
        
        journalView.tableViewJournals.delegate = self
        journalView.tableViewJournals.dataSource = self
        
        self.fetchUserJournalList()
        
    }
    
    @objc func addNewJournal() {
        
        let newJournalController = NewJournalViewController()
        newJournalController.currentUser = self.currentUser
        navigationController?.pushViewController(newJournalController, animated: true)
        
    }
    
}
