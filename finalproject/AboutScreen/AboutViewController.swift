//
//  AboutViewController.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/20/23.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let aboutLabel = UILabel()
        
        aboutLabel.text = "Mood fluctuations can disrupt students' concentration, engagement, and motivation, affecting their academic performance. To counter this, MoodMaster, a personalized mood management app, offers emotional support features to help stabilize the user's emotional state, leading to more effective learning."
        aboutLabel.numberOfLines = 0
        aboutLabel.textAlignment = .justified

        view.addSubview(aboutLabel)

        // Set up constraints for the label
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            aboutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            aboutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            aboutLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}

