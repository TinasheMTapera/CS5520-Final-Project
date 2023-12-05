//
//  RecordScreenViewController.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import UIKit
import AVFoundation
import FirebaseStorage

class RecordScreenViewController: UIViewController, AVAudioRecorderDelegate {
    
    let recordView = RecordScreenView()
    
    var audioRecorder: AVAudioRecorder?
    var audioFileName: URL?
    var recordingSession: AVAudioSession!
    
    var recordingList: [Recording] = []
    
    override func loadView() {
        view = recordView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Audio Moments"
        
        recordView.recordButton.addTarget(self, action: #selector(recordButtonTapped), for: .touchUpInside)
        
        recordView.tableViewRecordings.delegate = self
        recordView.tableViewRecordings.dataSource = self
        
        fetchRecordings()
    }
    
    @objc private func recordButtonTapped() {
        print("Record button tapped")

        if let recorder = audioRecorder {
            if recorder.isRecording {
                // Stop recording
                recorder.stop()
                do {
                    try AVAudioSession.sharedInstance().setActive(false)
                } catch {
                    print("Error stopping recording: \(error.localizedDescription)")
                }
                // Save the audio file to Firestore or perform any desired actions
            } else {
                // Start recording
                do {
                    try AVAudioSession.sharedInstance().setActive(true)
                    recorder.record()
                } catch {
                    print("Error starting recording: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func setupAudioRecorder() {
        // Create and configure the recording session
        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        // No need to load recording UI here
                    } else {
                        // Handle the case where recording permission is denied
                        // You might want to show an alert or take appropriate action
                    }
                }
            }

            // Set up audio recorder
            let audioSettings: [String: Any] = [
                AVFormatIDKey: kAudioFormatMPEG4AAC,
                AVSampleRateKey: 44100.0,
                AVNumberOfChannelsKey: 2,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]

            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFileName = documentsDirectory.appendingPathComponent("audioRecording.m4a")

            audioRecorder = try AVAudioRecorder(url: audioFileName!, settings: audioSettings)
            audioRecorder?.delegate = self
            audioRecorder?.prepareToRecord()
        } catch {
            print("Error setting up audio recorder: \(error.localizedDescription)")
        }
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }

    func finishRecording(success: Bool) {
        
        audioRecorder?.stop()
        audioRecorder = nil

        if success {
            
            recordView.recordButton.setTitle("Tap to Re-record", for: .normal)
            uploadRecordingToStorage()
            
        } else {
            print("recording failed")
            recordView.recordButton.setTitle("Tap to Record", for: .normal)
        }
    }

}
