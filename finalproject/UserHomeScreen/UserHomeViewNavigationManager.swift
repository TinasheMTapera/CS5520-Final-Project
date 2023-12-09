//
//  UserHomeViewNavigationManager.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import Foundation
import UIKit

extension UserHomeViewController {
    
    //setting up right side of the navBar with logo
    func setupLogoInNavBar(in navigationItem: UINavigationItem) {
        
        print("Entered setupLogoInNavBar")
        
        let appLogoImage = UIImage(named: "transparentlogo")
        let customView = UIView()
        
        //creating UIImageView with app logo
        let appLogoImageView = UIImageView(image: appLogoImage)
        appLogoImageView.contentMode = .scaleAspectFit // Set content mode to .scaleAspectFit
        
        //adding UIImageView to the custom view-
        customView.addSubview(appLogoImageView)
        
        //setting frame of UIImageView in the custom view
        appLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            appLogoImageView.topAnchor.constraint(equalTo: customView.topAnchor),
            appLogoImageView.bottomAnchor.constraint(equalTo: customView.bottomAnchor),
            appLogoImageView.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
            appLogoImageView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: 80)
        ])
        
        //adding tap gesture to detect user taps
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(aboutButtonTapped))
        tapGesture.numberOfTapsRequired = 1
        customView.addGestureRecognizer(tapGesture)
        
        //creating UIBarButtonItem with custom view
        let appLogoBarButton = UIBarButtonItem(customView: customView)
        
        //flexible space item to push logo to the right
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //setting action target of the button
        appLogoBarButton.action = #selector(aboutButtonTapped)
        appLogoBarButton.target = self
        
        //setting flexible space and logo as right button items
        navigationItem.rightBarButtonItems = [flexibleSpace, appLogoBarButton]
        
        print("Exiting setupLogoInNavBar")
    }
    
    //setting up left side of the navBar with logo
    func setupProfileIconInNavBar(in navigationItem: UINavigationItem) {
        
        let profileButton = UIButton(type: .system)
        
        //customizing button
        profileButton.setImage(UIImage(systemName: "person.fill"), for: .normal)
        profileButton.tintColor = UIColor.blue
        
        //size of the button's image (change the multiplier as needed)
        profileButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //setting button target
        profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        
        //creating UIBarButtonItem with custom button
        let profileBarButtonItem = UIBarButtonItem(customView: profileButton)
        
        //setting left button item
        navigationItem.leftBarButtonItem = profileBarButtonItem
        
    }
    
}
