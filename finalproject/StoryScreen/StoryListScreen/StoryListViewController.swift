//
//  StoryListViewController.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class StoryListViewController: UIViewController {
    
    let storyListView = StoryListView()
    
    var selectedMood: String = ""
    var selectedTimeframe: String = ""
    
    var snippetList: [Snippet] = []
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = storyListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting view title
        storyListView.titleLabel.text = "Snippets to help you feel \(selectedMood)"
        
        //configuring table in view
        storyListView.tableViewStories.delegate = self
        storyListView.tableViewStories.dataSource = self
        
        //fetch stories/snippets based on mood and timeframe
        fetchSnippetsFromFirebase()
    }
    
}
