//
//  RecordScreenTableManager.swift
//  finalproject
//
//  Created by Diya on 12/5/23.
//

import Foundation
import UIKit

//tableView configs
extension RecordScreenViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //show Label
        updateEmptyStateLabel()
        return recordingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableIdentifiers.tableViewRecordings, for: indexPath) as! RecordingTableViewCell
        
        let recording = recordingList[indexPath.row]
        cell.recordingNameLabel.text = recording.name
        
        cell.backgroundColor = AppColors.backgroundColor
        tableView.backgroundColor = AppColors.backgroundColor
        
        //configuring cell button options - delete/download
        let buttonOptions = UIButton(type: .system)
        buttonOptions.sizeToFit()
        buttonOptions.showsMenuAsPrimaryAction = true
        buttonOptions.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        buttonOptions.menu = UIMenu(title: "Options",
                                    children: [
                                        UIAction(title: "Download", handler: {(_) in
                                            self.downloadSelectedFor(recording: recording)
                                        }),
                                        UIAction(title: "Delete", handler: {(_) in
                                            self.deleteSelectedFor(recordingName: recording.name)
                                        })
                                    ])
        
        cell.accessoryView = buttonOptions
        
        return cell
    }
    
    func updateEmptyStateLabel() {
        recordView.emptyStateLabel.isHidden = !recordingList.isEmpty
    }
    
    func downloadSelectedFor(recording: Recording) {
        print("Entered downloadSelectedFor")
        downloadRecording(recording: recording)
        print("Exiting downloadSelectedFor")
    }
    
    func deleteSelectedFor(recordingName: String){
        print("Entered deleteSelectedFor")
        print(recordingName)
        showDeleteAlert(recordingName: recordingName)
    }
    
    func showDeleteAlert(recordingName: String) {
        
        let discardAlert = UIAlertAction(title: "Yes", style: .destructive) { (action) in
            self.deleteRecordingConfirmed(recordingName: recordingName)
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
    
    func downloadRecording(recording: Recording) {
        
        print("Entered downloadRecording")
        
        let url = recording.downloadURL
        
        let downloadTask = URLSession.shared.downloadTask(with: url) { (location, response, error) in
            
            DispatchQueue.main.async {
                guard error == nil else {
                    print("Error downloading recording: \(error!.localizedDescription)")
                    self.showErrorAlert(message: "Error downloading your recording")
                    return
                }
                
                guard let location = location else {
                    print("Error: Downloaded file location is nil.")
                    return
                }
                
                do {
                    let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    let destinationURL = documentsURL.appendingPathComponent(recording.name)
                    
                    //move downloaded file to desired location
                    try FileManager.default.moveItem(at: location, to: destinationURL)
                    print("Recording downloaded successfully. File saved at: \(destinationURL)")
                    
                } catch {
                    print("Error moving downloaded file: \(error.localizedDescription)")
                }
            }
        }
        
        downloadTask.resume()
        
        print("Exiting downloadRecording")
    }
    
    func showErrorAlert(message: String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
