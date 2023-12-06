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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedRecording = recordingList[indexPath.row]
        downloadRecording(recording: selectedRecording)
    }
    
    func updateEmptyStateLabel() {
        recordView.emptyStateLabel.isHidden = !recordingList.isEmpty
    }
    
    func downloadRecording(recording: Recording) {
        let url = recording.downloadURL

        let downloadTask = URLSession.shared.downloadTask(with: url) { (location, response, error) in
            guard error == nil else {
                print("Error downloading recording: \(error!.localizedDescription)")
                return
            }

            guard let location = location else {
                print("Error: Downloaded file location is nil.")
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
            }
        }

        downloadTask.resume()
    }
    
}
