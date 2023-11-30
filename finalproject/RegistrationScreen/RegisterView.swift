//
//  RegisterView.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.
//

import UIKit

class RegisterView: UIView {

    // MARK: - Properties
    
    let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Name: "
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Email: "
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Phone Number: "
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "RegisterButtonColor") // Customize the color if needed
        button.layer.cornerRadius = 15
        return button
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1.0)

        // Add the user name text field
        addSubview(userNameTextField)
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            userNameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            userNameTextField.widthAnchor.constraint(equalToConstant: 300),
            userNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Add the email text field
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 30),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Add the phone number text field
        addSubview(phoneNumberTextField)
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneNumberTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            phoneNumberTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            phoneNumberTextField.widthAnchor.constraint(equalToConstant: 300),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Add the register button
        addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 30),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
            registerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
