//
//  JournalMainViewTableManager.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import Foundation
import UIKit

//tableView configs
extension JournalMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //showLabel
        updateEmptyStateLabel()
        return journalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableIdentifiers.tableViewJournals, for: indexPath) as! JournalTableViewCell
        
        let journal = journalList[indexPath.row]
        cell.titleLabel.text = journal.title
        cell.textPrompt.text = journal.content
        
        cell.backgroundColor = AppColors.backgroundColor
        tableView.backgroundColor = AppColors.backgroundColor
        
        //customizing cell - adding delete option
        let deleteButton = setupDeleteButton()
        deleteButton.addAction(UIAction(title: "Delete", handler: { [weak self] _ in
            guard let self = self else { return }
            self.deleteSelectedFor(journalID: journal.journalID)
        }), for: .touchUpInside)
        cell.accessoryView = deleteButton
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let journal = journalList[indexPath.row]
        
        //handling edit
        
        //checking for existing view instance in stack
        if let newJournalController = navigationController?.viewControllers.first(where: { $0 is NewJournalViewController }) as? NewJournalViewController {
            newJournalController.currentUser = self.currentUser
            newJournalController.newJournalView.journalTitleTextField.text = journal.title
            newJournalController.newJournalView.journalTextView.text = journal.content
            newJournalController.currentAction = .edit(journalID: journal.journalID)
            newJournalViewController = newJournalController
            navigationController?.popToViewController(newJournalController, animated: true)
            
        } else {
            
            //new view instance
            let newJournalController = NewJournalViewController()
            newJournalController.currentUser = self.currentUser
            newJournalController.newJournalView.journalTitleTextField.text = journal.title
            newJournalController.newJournalView.journalTextView.text = journal.content
            newJournalController.currentAction = .edit(journalID: journal.journalID)
            newJournalViewController = newJournalController
            navigationController?.pushViewController(newJournalController, animated: true)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    func deleteSelectedFor(journalID: String){
        
        print("Entered deleteSelectedFor")
        showDeleteAlert(journalID: journalID)
        print("Exiting deleteSelectedFor")
    }
    
    func showDeleteAlert(journalID: String) {
        
        let discardAlert = UIAlertAction(title: "Yes", style: .destructive) { (action) in
            self.deleteJournalConfirmed(journalID: journalID)
        }
        
        let alert = UIAlertController(title: "Delete?", message: "Note will be deleted. You will not be able to access the content in this note again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .default))
        alert.addAction(discardAlert)
        self.present(alert, animated: true)
        
    }
    
    func showConfirmationAlert(message: String) {
        
        let alert = UIAlertController(title: "Deleted !", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func setupDeleteButton() -> UIButton {
        
        let buttonOptions = UIButton(type: .system)
        let buttonSize = CGSize(width: 40, height: 40)
        buttonOptions.frame.size = buttonSize
        
        //customizing button
        buttonOptions.tintColor = AppColors.redButton
        
        //setting size of image on button
        let imageSize = CGSize(width: 24, height: 24)
        let iconImage = UIImage(systemName: "trash.fill")?.withRenderingMode(.alwaysTemplate)
        let scaledImage = iconImage?.resize(targetSize: imageSize)
        buttonOptions.setImage(scaledImage, for: .normal)
        
        buttonOptions.backgroundColor = .clear
        buttonOptions.layer.cornerRadius = buttonSize.width / 2
        buttonOptions.layer.borderWidth = 1
        buttonOptions.layer.borderColor = UIColor.systemRed.cgColor
        
        buttonOptions.showsMenuAsPrimaryAction = true
        
        return buttonOptions
    }
    
    func updateEmptyStateLabel() {
        journalView.emptyStateLabel.isHidden = !journalList.isEmpty
    }
    
}
