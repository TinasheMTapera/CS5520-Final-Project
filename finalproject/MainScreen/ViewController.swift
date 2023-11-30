//
//  ViewController.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Create an instance of MainView
//        let mainView = MainView()
//
//        // Set mainView as the view of the ViewController
//        self.view = mainView
//    }
//}

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create an instance of MainView
        let mainView = MainView()

        // Set mainView as the view of the ViewController
        self.view = mainView

        // Set up action for the register button in MainView
        mainView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        mainView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    @objc private func registerButtonTapped() {
        // Instantiate RegistrationViewController
        print("Register button tapped")

        // Check if navigationController exists and the stack is not empty
        guard let navigationController = navigationController, !navigationController.viewControllers.isEmpty else {
            print("Navigation controller is nil or stack is empty")
            return
        }
        let registrationVC = RegistrationViewController()

        // Push RegistrationViewController to the navigation stack
        navigationController.pushViewController(registrationVC, animated: true)
    }
    
    @objc private func loginButtonTapped() {
        // Instantiate OptionViewController
        print("Login button tapped")

        // Check if navigationController exists
        guard let navigationController = navigationController else {
            print("Navigation controller is nil")
            return
        }

        // Pop the current view controller from the navigation stack
        navigationController.popViewController(animated: true)

        // Instantiate and push OptionViewController to the navigation stack
        let optionVC = OptionViewController()
        navigationController.pushViewController(optionVC, animated: true)
    }

}


