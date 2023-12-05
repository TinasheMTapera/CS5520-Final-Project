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
        
        guard let audioFileName = audioFileName else {
                return
            }

            let storageRef = Storage.storage().reference().child("audioRecordings").child(UUID().uuidString + ".m4a")

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
        
    }
}
