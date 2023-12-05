//
//  StoryListTableManager.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import Foundation
import UIKit

extension StoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snippetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableIdentifiers.tableViewStories, for: indexPath) as! StoryTableViewCell
        
        let snippet = snippetList[indexPath.row]
        cell.titleLabel.text = snippet.title
        cell.textPrompt.text = snippet.content
        
        cell.backgroundColor = AppColors.backgroundColor
        tableView.backgroundColor = AppColors.backgroundColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let snippet = snippetList[indexPath.row]
        print("snippet deets -- \(snippet.title) and \(snippet.content)")
        
        if let storyDisplayController = navigationController?.viewControllers.first(where: { $0 is NewJournalViewController }) as? StoryDisplayViewController {
            storyDisplayController.storyDisplayView.titleLabel.text = snippet.title
            storyDisplayController.storyDisplayView.contentLabel.text = snippet.content
            navigationController?.popToViewController(storyDisplayController, animated: true)
            
        } else {
            
            let storyDisplayController = StoryDisplayViewController()
            storyDisplayController.storyDisplayView.titleLabel.text = snippet.title
            storyDisplayController.storyDisplayView.contentLabel.text = snippet.content
            navigationController?.pushViewController(storyDisplayController, animated: true)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
