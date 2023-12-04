//
//  UserHomeViewButtonManager.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import Foundation
import UIKit

extension UserHomeViewController {
    
    func setupUserHomeViewButtons() {
        
        userHomeView.readStoriesButton.addTarget(self, action: #selector(readStoriesButtonTapped), for: .touchUpInside)
        userHomeView.writeJournalButton.addTarget(self, action: #selector(writeJournalButtonTapped), for: .touchUpInside)
        userHomeView.recordMomentsButton.addTarget(self, action: #selector(recordMomentsButtonTapped), for: .touchUpInside)
        
        let transformationProperties = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.userHomeView.readStoriesButton.transform = CGAffineTransform.identity
        }, completion: nil)
        
        userHomeView.readStoriesButton.transform = transformationProperties
        userHomeView.writeJournalButton.transform = transformationProperties
        userHomeView.recordMomentsButton.transform = transformationProperties
        
        
        userHomeView.readStoriesButton.addTarget(self,
                                                 action: #selector(buttonTouchDown(for:)),
                                                 for: .touchDown)
        userHomeView.readStoriesButton.addTarget(self,
                                                 action: #selector(buttonTouchUpInside(for:)),
                                                 for: .touchUpInside)
        
        userHomeView.writeJournalButton.addTarget(self,
                                                 action: #selector(buttonTouchDown(for:)),
                                                 for: .touchDown)
        userHomeView.writeJournalButton.addTarget(self,
                                                 action: #selector(buttonTouchUpInside(for:)),
                                                 for: .touchUpInside)
        
        userHomeView.recordMomentsButton.addTarget(self,
                                                 action: #selector(buttonTouchDown(for:)),
                                                 for: .touchDown)
        userHomeView.recordMomentsButton.addTarget(self,
                                                 action: #selector(buttonTouchUpInside(for:)),
                                                 for: .touchUpInside)
    }
    
    @objc func buttonTouchDown(for button: UIButton) {
        
        // Handle touch down event (highlight the button)
        button.backgroundColor = AppColors.greenButton
    }
    
    @objc func buttonTouchUpInside(for button: UIButton) {
        // Handle touch up inside event (revert to normal state)
        button.backgroundColor = AppColors.blueButton
    }
    
    @objc func readStoriesButtonTapped() {
        print("Read Stories button tapped")
        // Handle the action for the "Read Something" button
        
        let storiesController = StoriesMainViewController()
        navigationController?.pushViewController(storiesController, animated: true)
    }
    
    @objc func writeJournalButtonTapped() {
        print("Journal button tapped")
        // Handle the action for the "Journal" button
        
        let journalController = JournalMainViewController()
        journalController.currentUser = self.currentUser
        navigationController?.pushViewController(journalController, animated: true)
    }
    
    @objc func recordMomentsButtonTapped() {
        
        print("Record button tapped")
        // Handle the action for the "Journal" button
        
        let recordController = RecordScreenViewController()
//        journalController.currentUser = self.currentUser
        navigationController?.pushViewController(recordController, animated: true)
    }
}
