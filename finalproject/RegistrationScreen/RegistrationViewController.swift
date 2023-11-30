//
//  RegistrationViewController.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.
//

import UIKit

class RegistrationViewController: UIViewController {

    // MARK: - Properties
    
    let registerView: RegisterView = {
        let view = RegisterView()
        return view
    }()

    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UI Setup
    
    private func setupUI() {
        title = "Please Register New User"
        view.backgroundColor = .white

        // Add the RegisterView
        view.addSubview(registerView)
        registerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            registerView.topAnchor.constraint(equalTo: view.topAnchor),
            registerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

