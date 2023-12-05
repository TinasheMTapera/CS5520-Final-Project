//
//  RecordScreenTableManager.swift
//  finalproject
//
//  Created by Diya on 12/5/23.
//

import Foundation
import UIKit

extension RecordScreenViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        updateEmptyStateLabel()
        return recordingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableIdentifiers.tableViewStories, for: indexPath) as! StoryTableViewCell
        
        let recording = recordingList[indexPath.row]
//        cell.titleLabel.text = recording.title
//        cell.textPrompt.text = recording.content
        
        cell.backgroundColor = AppColors.backgroundColor
        tableView.backgroundColor = AppColors.backgroundColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let recording = recordingList[indexPath.row]
//        print("recording deets -- \(recording.title) and \(recording.content)")
        
//        if let storyDisplayController = navigationController?.viewControllers.first(where: { $0 is NewJournalViewController }) as? StoryDisplayViewController {
//
//            storyDisplayController.storyDisplayView.titleLabel.text = recording.title
//            storyDisplayController.storyDisplayView.contentLabel.text = recording.content
//            navigationController?.popToViewController(storyDisplayController, animated: true)
//            
//        } else {
//            
//            let storyDisplayController = StoryDisplayViewController()
//            storyDisplayController.storyDisplayView.titleLabel.text = recording.title
//            storyDisplayController.storyDisplayView.contentLabel.text = recording.content
//            navigationController?.pushViewController(storyDisplayController, animated: true)
//        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func updateEmptyStateLabel() {
        recordView.emptyStateLabel.isHidden = !recordingList.isEmpty
    }
    
}
