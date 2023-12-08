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

        let cell = tableView.dequeueReusableCell(withIdentifier: TableIdentifiers.tableViewRecordings, for: indexPath) as! RecordingTableViewCell
        
        let recording = recordingList[indexPath.row]
        cell.recordingNameLabel.text = recording.name
        
        cell.backgroundColor = AppColors.backgroundColor
        tableView.backgroundColor = AppColors.backgroundColor
        
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
        
//        tableView.reloadData()
        
        return cell
    }
    
    func updateEmptyStateLabel() {
        recordView.emptyStateLabel.isHidden = !recordingList.isEmpty
    }
    
    func downloadSelectedFor(recording: Recording) {
        downloadRecording(recording: recording)
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
        
        print("Downloading selected recording")
        let url = recording.downloadURL

        let downloadTask = URLSession.shared.downloadTask(with: url) { (location, response, error) in
            
            DispatchQueue.main.async {
                guard error == nil else {
                    print("Error downloading recording: \(error!.localizedDescription)")
                    // Handle the error appropriately, e.g., show an alert to the user
                    return
                }

                guard let location = location else {
                    print("Error: Downloaded file location is nil.")
                    // Handle the error appropriately, e.g., show an alert to the user
                    return
                }

                do {
                    let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    let destinationURL = documentsURL.appendingPathComponent(recording.name)

                    // Move the downloaded file to the desired location
                    try FileManager.default.moveItem(at: location, to: destinationURL)

                    // Optionally, you can notify your UI or perform further actions with the downloaded file URL
                    print("Recording downloaded successfully. File saved at: \(destinationURL)")

                } catch {
                    print("Error moving downloaded file: \(error.localizedDescription)")
                    // Handle the error appropriately, e.g., show an alert to the user
                }
            }
        }

        downloadTask.resume()
    }
}
