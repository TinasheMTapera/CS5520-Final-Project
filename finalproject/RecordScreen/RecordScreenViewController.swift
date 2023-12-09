//
//  RecordScreenViewController.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import UIKit
import AVFoundation
import FirebaseAuth
import FirebaseStorage

class RecordScreenViewController: UIViewController, AVAudioRecorderDelegate {
    
    let recordView = RecordScreenView()
    
    var currentUser: FirebaseAuth.User?
    let storageRef = Storage.storage().reference()
    
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
        
        //setup audio functionality
        setupAudioRecorder()
        
        //setting view button targets
        recordView.recordButton.addTarget(self, action: #selector(recordButtonTapped), for: .touchUpInside)
        
        //configuring table in view
        recordView.tableViewRecordings.delegate = self
        recordView.tableViewRecordings.dataSource = self
        
        //fetching existing user recordings
        fetchRecordings()
    }
    
    @objc private func recordButtonTapped() {
        
        print("Entered recordButtonTapped")
        
        if let recorder = audioRecorder {
            
            if recorder.isRecording {
                
                //stop recording
                recorder.stop()
                finishRecording(success: true)
                
            } else {
                
                //start recording
                do {
                    try AVAudioSession.sharedInstance().setActive(true)
                    recorder.record()
                    //indicating recording
                    recordView.recordButton.tintColor = AppColors.redButton
                    
                } catch {
                    print("Error starting recording: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func setupAudioRecorder() {
        print("Entered setupAudioRecorder")
        
        // Create and configure the recording session
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission { [unowned self] allowed in
                DispatchQueue.main.async {
                    //handled permissions
                }
            }
            
            //setup audio recorder
            let audioSettings: [String: Any] = [
                AVFormatIDKey: kAudioFormatMPEG4AAC,
                AVSampleRateKey: 44100.0,
                AVNumberOfChannelsKey: 2,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            //configuring audio settings
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFileName = documentsDirectory.appendingPathComponent("audioRecording.m4a")
            
            audioRecorder = try AVAudioRecorder(url: audioFileName!, settings: audioSettings)
            audioRecorder?.delegate = self
            audioRecorder?.prepareToRecord()
            
        } catch {
            print("Error setting up audio recorder: \(error.localizedDescription)")
        }
        
        print("Exiting setupAudioRecorder")
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    func finishRecording(success: Bool) {
        
        print("finish recording")
        audioRecorder?.stop()
        audioRecorder = nil
        
        if success {
            //upload recording
            uploadRecordingToStorage()
            
        } else {
            print("recording failed")
        }
    }
    
}
