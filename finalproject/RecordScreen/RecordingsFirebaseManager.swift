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
        
        print("Entered uploadRecordingToStorage")
        
        guard let audioFileName = audioFileName, let userEmail = self.currentUser?.email else {
            return
        }
        
        //creating ref to file
        let storageRef = storageRef.child(FirebaseConfigs.listOfAudioRecordings).child(userEmail).child(UUID().uuidString + ".m4a")
        
        //uploading recording to storage
        let uploadTask = storageRef.putFile(from: audioFileName, metadata: nil) { metadata, error in
            guard error == nil else {
                print("Error uploading file: \(error!.localizedDescription)")
                return
            }
            
            //fetching downloadURL
            storageRef.downloadURL { url, error in
                guard let downloadURL = url else {
                    print("Error getting download URL: \(error!.localizedDescription)")
                    return
                }
                
                print("Download URL: \(downloadURL.absoluteString)")
            }
        }
        
        //updates on upload
        uploadTask.observe(.progress) { snapshot in
            print("Uploading file to storage")
        }
        
        uploadTask.observe(.success) { snapshot in
            print("Uploaded file successfully")
        }
        
        uploadTask.observe(.failure) { snapshot in
            print("Failed to upload file to storage")
        }
        
        print("Exiting uploadRecordingToStorage")
    }
    
    func fetchRecordings() {
        
        print("Entered fetchRecordings")
        
        //empty list
        recordingList.removeAll()
        
        if let userEmail = self.currentUser?.email {
            
            //creating reference to file
            let storageRef = storageRef.child(FirebaseConfigs.listOfAudioRecordings).child(userEmail)
            
            //listing files in storage
            storageRef.listAll(completion: { (result, error) in
                
                if error == nil {
                    
                    if let userRecordings = result {
                        for recording in userRecordings.items {
                            
                            recording.downloadURL(completion: { (url, error) in
                                
                                if error == nil {
                                    if let downloadURL = url {
                                        
                                        let userRecording = Recording(name: recording.name, downloadURL: downloadURL)
                                        self.recordingList.append(userRecording)
                                    }
                                    
                                    DispatchQueue.main.async {
                                        //reload table data
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
        
        print("Exiting fetchRecordings")
    }
    
    func deleteRecordingConfirmed(recordingName: String) {
        
        print("Entered deleteRecordingConfirmed")
        
        if let userEmail = self.currentUser?.email {
            let storageRef = storageRef.child(FirebaseConfigs.listOfAudioRecordings).child(userEmail).child(recordingName)
            
            //deleting selected recording
            storageRef.delete(completion: { error in
                
                if error == nil {
                    print("Successfully deleted recording with filePath -- \(recordingName)")
                    self.showConfirmationAlert(message: "Successfully Deleted")
                    self.fetchRecordings()
                    self.recordView.tableViewRecordings.reloadData()
                }
                
            })
        }
        
        print("Exiting deleteRecordingConfirmed")
    }
}
