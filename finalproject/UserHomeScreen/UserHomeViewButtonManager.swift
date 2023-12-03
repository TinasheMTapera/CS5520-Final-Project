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
        
        userHomeView.readSomethingButton.addTarget(self, action: #selector(readSomethingButtonTapped), for: .touchUpInside)
        userHomeView.journalButton.addTarget(self, action: #selector(journalButtonTapped), for: .touchUpInside)
        
        userHomeView.readSomethingButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.userHomeView.readSomethingButton.transform = CGAffineTransform.identity
        }, completion: nil)
        
        userHomeView.readSomethingButton.addTarget(self, action: #selector(readSomethingButtonTouchDown), for: .touchDown)
        userHomeView.readSomethingButton.addTarget(self, action: #selector(readSomethingButtonTouchUpInside), for: .touchUpInside)
        
        userHomeView.journalButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.userHomeView.journalButton.transform = CGAffineTransform.identity
        }, completion: nil)
        
        userHomeView.journalButton.addTarget(self, action: #selector(journalButtonTouchDown), for: .touchDown)
        userHomeView.journalButton.addTarget(self, action: #selector(journalButtonTouchUpInside), for: .touchUpInside)
        
    }
    
    @objc private func readSomethingButtonTouchDown() {
        // Handle touch down event (highlight the button)
        userHomeView.readSomethingButton.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.8)
    }
    
    @objc private func readSomethingButtonTouchUpInside() {
        // Handle touch up inside event (revert to normal state)
        userHomeView.readSomethingButton.backgroundColor = AppColors.buttonColor
    }
    
    @objc private func journalButtonTouchDown() {
        // Handle touch down event (highlight the button)
        userHomeView.journalButton.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.8)
    }
    
    @objc private func journalButtonTouchUpInside() {
        // Handle touch up inside event (revert to normal state)
        userHomeView.journalButton.backgroundColor = UIColor.systemBlue
    }
    
    @objc private func readSomethingButtonTapped() {
        print("Read Something button tapped")
        // Handle the action for the "Read Something" button
        
        let storiesController = StoriesMainViewController()
        navigationController?.pushViewController(storiesController, animated: true)
    }
    
    @objc private func journalButtonTapped() {
        print("Journal button tapped")
        // Handle the action for the "Journal" button
        
        let journalController = JournalMainViewController()
        navigationController?.pushViewController(journalController, animated: true)
    }
    
}
