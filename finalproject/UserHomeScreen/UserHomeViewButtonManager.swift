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
        
        //setting view button targets
        userHomeView.readStoriesButton.addTarget(self, action: #selector(readStoriesButtonTapped), for: .touchUpInside)
        userHomeView.writeJournalButton.addTarget(self, action: #selector(writeJournalButtonTapped), for: .touchUpInside)
        userHomeView.recordMomentsButton.addTarget(self, action: #selector(recordMomentsButtonTapped), for: .touchUpInside)
        
        //UIvisuals for buttons
        let transformationProperties = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.userHomeView.readStoriesButton.transform = CGAffineTransform.identity
        }, completion: nil)
        
        //adding UI effects to buttons
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
        
        print("Entered readStoriesButtonTapped")
        
        let storiesController = StoriesMainViewController()
        storiesController.currentUser = self.currentUser
        navigationController?.pushViewController(storiesController, animated: true)
        
        print("Exiting readStoriesButtonTapped")
    }
    
    @objc func writeJournalButtonTapped() {
        
        print("Entered writeJournalButtonTapped")
        
        let journalController = JournalMainViewController()
        journalController.currentUser = self.currentUser
        navigationController?.pushViewController(journalController, animated: true)
        
        print("Exiting writeJournalButtonTapped")
    }
    
    @objc func recordMomentsButtonTapped() {
        
        print("Entered recordMomentsButtonTapped")
        
        let recordController = RecordScreenViewController()
        recordController.currentUser = self.currentUser
        navigationController?.pushViewController(recordController, animated: true)
        
        print("Exiting recordMomentsButtonTapped")
    }
}
