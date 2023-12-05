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
        print("count -- \(snippetList.count)")
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
        
//        if let newJournalController = navigationController?.viewControllers.first(where: { $0 is NewJournalViewController }) as? NewJournalViewController {
//            newJournalController.currentUser = self.currentUser
//            newJournalController.newJournalView.journalTitleTextField.text = journal.title
//            newJournalController.newJournalView.journalTextView.text = journal.content
//            newJournalController.currentAction = .edit(journalID: journal.journalID)
//            newJournalViewController = newJournalController
//            navigationController?.popToViewController(newJournalController, animated: true)
//            
//        } else {
//            
//            let newJournalController = NewJournalViewController()
//            newJournalController.currentUser = self.currentUser
//            newJournalController.newJournalView.journalTitleTextField.text = journal.title
//            newJournalController.newJournalView.journalTextView.text = journal.content
//            newJournalController.currentAction = .edit(journalID: journal.journalID)
//            newJournalViewController = newJournalController
//            navigationController?.pushViewController(newJournalController, animated: true)
//        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
