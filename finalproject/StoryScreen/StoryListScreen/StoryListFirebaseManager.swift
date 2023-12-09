//
//  StoryListFirebaseManager.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import Foundation

extension StoryListViewController {
    
    func fetchSnippetsFromFirebase() {
        
        print("Entered fetchSnippetsFromFirebase")
        
        print("fetching snippet for mood -- \(selectedMood) and timeframe -- \(selectedTimeframe)")
        
        //clear list
        self.snippetList.removeAll()
        
        let fetchedSnippets = database.collection(FirebaseConfigs.listOfStories)
            .document(selectedMood)
            .collection(FirebaseConfigs.listOfTimeframes)
            .document(selectedTimeframe)
            .collection(FirebaseConfigs.listOfSnippets)
        
        //get docs
        fetchedSnippets.getDocuments(completion: { (querySnapshot, error) in
            
            if error == nil {
                
                guard let querySnapshot = querySnapshot else {
                    print("No snippets found.")
                    return
                }
                
                let storyCount = querySnapshot.documents.count
                
                for snippetDocument in querySnapshot.documents {
                    
                    do {
                        if let snippetData = try? snippetDocument.data(as: Snippet.self) {
                            self.snippetList.append(snippetData)
                            
                            DispatchQueue.main.async {
                                //reload data in table
                                self.storyListView.tableViewStories.reloadData()
                            }
                        }
                    } catch {
                        print("Error decoding snippet data: \(error)")
                    }
                }
            }
            else {
                print("Failed to load stories for the selected mood and timeframe")
            }
            
        })
        print("Exiting fetchSnippetsFromFirebase")
    }
}
