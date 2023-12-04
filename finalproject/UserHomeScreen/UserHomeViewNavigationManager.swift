//
//  UserHomeViewNavigationManager.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import Foundation
import UIKit

extension UserHomeViewController {
    
    func setupLogoInNavBar(in navigationItem: UINavigationItem) {
        
        let appLogoImage = UIImage(named: "transparentlogo")
        let customView = UIView()
        
        // Create a UIImageView with the app logo
        let appLogoImageView = UIImageView(image: appLogoImage)
        appLogoImageView.contentMode = .scaleAspectFit // Set content mode to .scaleAspectFit
        
        // Add the UIImageView to the custom view
        customView.addSubview(appLogoImageView)
        
        // Set the frame of the UIImageView within the custom view
        appLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appLogoImageView.topAnchor.constraint(equalTo: customView.topAnchor),
            appLogoImageView.bottomAnchor.constraint(equalTo: customView.bottomAnchor),
            appLogoImageView.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
            appLogoImageView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: 80)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(aboutButtonTapped))

        // Set the number of taps required
        tapGesture.numberOfTapsRequired = 1

        // Add the gesture recognizer to the custom view
        customView.addGestureRecognizer(tapGesture)
        
        // Create a UIBarButtonItem with the custom view
        let appLogoBarButton = UIBarButtonItem(customView: customView)
        
        // Create a flexible space item to push the logo to the right
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        appLogoBarButton.action = #selector(aboutButtonTapped)

        // Set the target of the UIBarButtonItem to self
        appLogoBarButton.target = self
        
        navigationItem.rightBarButtonItems = [flexibleSpace, appLogoBarButton]
    }
    
}