//
//  AboutViewController.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/20/23.
//

import UIKit
import MessageUI

class AboutScreenViewController: UIViewController {
    
    let aboutView = AboutScreenView()
    
    override func loadView() {
        view = aboutView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRightNavBar()
        
    }
    
    func setupRightNavBar() {
        
        let emailIcon = UIImage(systemName: "envelope.fill")
        let emailButton = UIBarButtonItem(image: emailIcon, style: .plain, target: self, action: #selector(emailButtonTapped))
        
        // Set a custom size for the bar button item
        emailButton.image = emailIcon?.withRenderingMode(.alwaysOriginal).withTintColor(AppColors.greenButton)
        emailButton.width = 40
        
        navigationItem.rightBarButtonItem = emailButton
        
    }
    
    @objc private func emailButtonTapped() {
        // Open email option
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.mailComposeDelegate = self
            mailComposeViewController.setToRecipients(["wadhwani.d@northeastern.edu"])
            mailComposeViewController.setSubject("Feedback")
            present(mailComposeViewController, animated: true, completion: nil)
        } else {
            // Handle the case where the device is not configured for email
            print("Device not configured for email")
        }
    }
}

extension AboutScreenViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

