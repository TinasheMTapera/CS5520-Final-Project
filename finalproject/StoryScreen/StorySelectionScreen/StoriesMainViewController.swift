//
//  StoriesMainViewController.swift
//  finalproject
//
//  Created by Diya on 12/2/23.
//

import UIKit
import FirebaseAuth

class StoriesMainViewController: UIViewController {
    
    let storyView = StoriesMainView()
    var selectedMood = MoodCategories.moods[0]
    var selectedTimeframe = Timeframes.timeframes[0]
    
    var currentUser: FirebaseAuth.User?
    
    override func loadView() {
        view = storyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configuring picker buttons in view
        storyView.moodPickerButton.delegate = self
        storyView.moodPickerButton.dataSource = self
        
        storyView.timeframePickerButton.delegate = self
        storyView.timeframePickerButton.dataSource = self
        
        //setting button targets
        storyView.goArrowButton.addTarget(self, action: #selector(displayStoryList), for: .touchUpInside)
        
    }
    
    @objc func displayStoryList() {
        
        print("Entered displayStoryList")
        
        let storyListController = StoryListViewController()
        storyListController.selectedMood = self.selectedMood
        storyListController.selectedTimeframe = self.selectedTimeframe
        navigationController?.pushViewController(storyListController, animated: true)
        
        print("Exiting displayStoryList")
        
    }
    
}
