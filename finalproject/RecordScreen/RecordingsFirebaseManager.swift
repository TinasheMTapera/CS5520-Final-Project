//
//  RecordingsFirebaseManager.swift
//  finalproject
//
//  Created by Diya on 12/5/23.
//

import Foundation
import FirebaseStorage

extension RecordScreenViewController {
    
    func uploadRecordingToStorage() {
        
        print("uploading recording to storage")
        guard let audioFileName = audioFileName, let userEmail = self.currentUser?.email else {
            return
        }
        
        let storageRef = storageRef.child(FirebaseConfigs.listOfAudioRecordings).child(userEmail).child(UUID().uuidString + ".m4a")
        
        let uploadTask = storageRef.putFile(from: audioFileName, metadata: nil) { metadata, error in
            guard error == nil else {
                print("Error uploading file: \(error!.localizedDescription)")
                return
            }
            
            // Upload succeeded, now get the download URL
            storageRef.downloadURL { url, error in
                guard let downloadURL = url else {
                    print("Error getting download URL: \(error!.localizedDescription)")
                    return
                }
                
                // Use the downloadURL as needed (e.g., save it to Firebase Database)
                print("Download URL: \(downloadURL.absoluteString)")
            }
        }
        
        // You can also observe the progress of the upload if needed
        uploadTask.observe(.progress) { snapshot in
            // Handle progress updates
        }
        
        uploadTask.observe(.success) { snapshot in
            // Handle successful completion
        }
        
        uploadTask.observe(.failure) { snapshot in
            // Handle failure
        }
    }
    
    func fetchRecordings() {
        
        recordingList.removeAll()
        if let userEmail = self.currentUser?.email {
            
            let storageRef = storageRef.child(FirebaseConfigs.listOfAudioRecordings).child(userEmail)
            
            storageRef.listAll(completion: { (result, error) in
                
                if error == nil {
                    
                    if let userRecordings = result {
                        for recording in userRecordings.items {
                            
                            print("recording name -- \(recording.name)")
                            recording.downloadURL(completion: { (url, error) in
                                
                                if error == nil {
                                    if let downloadURL = url {
                                        print("downloadURL -- \(downloadURL)")
                                        
                                        let userRecording = Recording(name: recording.name, downloadURL: downloadURL)
                                        self.recordingList.append(userRecording)
                                    }
                                    
                                    DispatchQueue.main.async {
                                        self.recordView.tableViewRecordings.reloadData()
                                    }
                                }
                                else {
                                    print("Error fetching downloadURL : \(error!.localizedDescription)")
                                    return
                                }
                                
                            })
                        }
                    }
                    
                }
                else {
                    print("Error listing recordings: \(error!.localizedDescription)")
                    return
                }
                
            })
        }
        
    }
    
    func deleteRecordingConfirmed(recordingName: String) {
        
        if let userEmail = self.currentUser?.email {
            let storageRef = storageRef.child(FirebaseConfigs.listOfAudioRecordings).child(userEmail).child(recordingName)
            
            storageRef.delete(completion: { error in
                
                if error == nil {
                    print("Successfully deleted recording with filePath -- \(recordingName)")
                    self.showConfirmationAlert(message: "Successfully Deleted")
                    self.fetchRecordings()
                    self.recordView.tableViewRecordings.reloadData()
                }
                
            })
        }
    }
}
