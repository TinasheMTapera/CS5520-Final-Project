//
//  JournalMainViewTableManager.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import Foundation
import UIKit

extension JournalMainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journal", for: indexPath) as! JournalTableViewCell
        
        let journal = journalList[indexPath.row]
        cell.titleLabel.text = journal.title
        
        cell.backgroundColor = UIColor(red: 0.80, green: 0.93, blue: 0.99, alpha: 1.00)
        tableView.backgroundColor = UIColor(red: 0.80, green: 0.93, blue: 0.99, alpha: 1.00)
        
        let buttonOptions = UIButton(type: .system)
        buttonOptions.sizeToFit()
        buttonOptions.showsMenuAsPrimaryAction = true
        buttonOptions.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        buttonOptions.menu = UIMenu(title: "Options",
                                    children: [
                                        UIAction(title: "Delete", handler: {(_) in
                                            self.deleteSelectedFor(journalID: journal.journalID)
                                        })
                                    ])
        
        cell.accessoryView = buttonOptions
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let note = journalList[indexPath.row]
//        
//        let noteDetailsController = NoteDetailsViewController()
//        navigationController?.pushViewController(noteDetailsController, animated: true)
//        
//        noteDetailsController.displayNote(text: note.noteText)
//        let alert = UIAlertController(title: "Non-editable", message: "This note cannot be edited and is for viewing purposes only", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        self.present(alert, animated: true)
    }
    
    
    func deleteSelectedFor(journalID: String){
        print("Entered deleteSelectedFor")
        print(journalID)
        showDeleteAlert(journalID: journalID)
    }
    
    func showDeleteAlert(journalID: String) {
        
        let discardAlert = UIAlertAction(title: "Yes", style: .destructive) { (action) in
            self.deleteNoteConfirmed(journalID: journalID)
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
    
    func showErrorAlert(message:String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
}
