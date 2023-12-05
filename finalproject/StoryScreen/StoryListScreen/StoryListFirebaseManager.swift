//
//  StoryListFirebaseManager.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import Foundation

extension StoryListViewController {
    
    func fetchSnippetsFromFirebase() {
        
        print("fetching snippet for mood -- \(selectedMood) and timeframe -- \(selectedTimeframe)")
        
        self.snippetList.removeAll()
        
        let fetchedSnippets = database.collection(FirebaseConfigs.listOfStories)
            .document(selectedMood)
            .collection(FirebaseConfigs.listOfTimeframes)
            .document(selectedTimeframe)
            .collection(FirebaseConfigs.listOfSnippets)
        
        fetchedSnippets.getDocuments(completion: { (querySnapshot, error) in
            
            if error == nil {
                
                guard let querySnapshot = querySnapshot else {
                    print("No snippets found.")
                    return
                }
                
                let storyCount = querySnapshot.documents.count
                print("Number of snippets -- \(storyCount)")
                
                for snippetDocument in querySnapshot.documents {
                        // Safely attempt to extract data from the document
                        do {
                            
                            if let snippetData = try? snippetDocument.data(as: Snippet.self) {
                                print("Title: \(snippetData.title), Content: \(snippetData.content)")
                                self.snippetList.append(snippetData)
                                
                                DispatchQueue.main.async {
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
        
    }
    
}
