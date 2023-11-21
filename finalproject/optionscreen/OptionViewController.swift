//
//  OptionViewController.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.
//
import UIKit
import Foundation

class OptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create an instance of OptionView
        let optionView = OptionView()

        // Set background color for better visibility
        view.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1.0)

        // Add the OptionView as a subview
        view.addSubview(optionView)

        // Set up constraints for the OptionView
        NSLayoutConstraint.activate([
            optionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            optionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            optionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            optionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }

    // Define the target actions for each button
    @objc private func homeButtonTapped() {
        print("Home button tapped")
    }

    @objc private func profileButtonTapped() {
        print("Profile button tapped")
    }

    @objc private func aboutButtonTapped() {
        print("About button tapped")
        // Handle navigation to the about screen or any other desired action
    }

    @objc private func readSomethingButtonTapped() {
        print("Read Something button tapped")
        // Handle the action for the "Read Something" button
    }

    @objc private func journalButtonTapped() {
        print("Journal button tapped")
        // Handle the action for the "Journal" button
    }
}


//import UIKit
//
//class OptionViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Create an instance of OptionView
//        let optionView = OptionView()
//
//        // Set background color for better visibility
//        view.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1.0)
//
//
//        // Add the OptionView as a subview
//        view.addSubview(optionView)
//
//        // Set up constraints for the OptionView
//        NSLayoutConstraint.activate([
//            optionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            optionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            optionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            optionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        
//    }
//}

