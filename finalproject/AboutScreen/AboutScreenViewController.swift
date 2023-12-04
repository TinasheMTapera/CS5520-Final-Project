//
//  AboutViewController.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/20/23.
//

import UIKit

class AboutScreenViewController: UIViewController {
    
    let aboutView = AboutScreenView()
    
    override func loadView() {
        view = aboutView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "Welcome to MoodMaster"
        
    }
}

