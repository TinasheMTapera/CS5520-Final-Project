//
//  StoryListTableManager.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import Foundation
import UIKit

//tableView configs
extension StoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snippetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableIdentifiers.tableViewStories, for: indexPath) as! StoryTableViewCell
        
        //displaying data in cell
        let snippet = snippetList[indexPath.row]
        cell.titleLabel.text = snippet.title
        cell.textPrompt.text = snippet.content
        
        cell.backgroundColor = AppColors.backgroundColor
        tableView.backgroundColor = AppColors.backgroundColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let snippet = snippetList[indexPath.row]
        
        //checking for existing view instance in stack
        if let storyDisplayController = navigationController?.viewControllers.first(where: { $0 is NewJournalViewController }) as? StoryDisplayViewController {
            storyDisplayController.storyDisplayView.titleLabel.text = snippet.title
            storyDisplayController.storyDisplayView.contentLabel.text = snippet.content
            navigationController?.popToViewController(storyDisplayController, animated: true)
            
        } else {
            
            //new view instance
            let storyDisplayController = StoryDisplayViewController()
            storyDisplayController.storyDisplayView.titleLabel.text = snippet.title
            storyDisplayController.storyDisplayView.contentLabel.text = snippet.content
            navigationController?.pushViewController(storyDisplayController, animated: true)
        }
    }
    
}
