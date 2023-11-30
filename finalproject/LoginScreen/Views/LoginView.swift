//
//  MainView.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.
//

import UIKit

class LoginView: UIView {

    // MARK: - Properties
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "MoodMaster"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = UIColor(named: "AppNameColor") // Customize the color if needed
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "NavyBlueColor") // Customize the color if needed
        button.layer.cornerRadius = 8
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "RegisterButtonColor") // Customize the color if needed
        button.layer.cornerRadius = 8
        return button
    }()
    
    let registerPromptLabel: UILabel = {
        let label = UILabel()
        label.text = "If you don't have an account, please register."
        label.textAlignment = .center
        label.textColor = .gray
        label.numberOfLines = 0
        return label
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

        // Add the logo
        addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        // Add the label
        addSubview(appNameLabel)
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            appNameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20)
        ])
        
        // Add the email text field
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 40),
            emailTextField.widthAnchor.constraint(equalToConstant: 250),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Add the password text field
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 250),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Add the login button
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
//        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        // Add the register prompt label
        addSubview(registerPromptLabel)
        registerPromptLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerPromptLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerPromptLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerPromptLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        // Add the register button
        addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: registerPromptLabel.bottomAnchor, constant: 20),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
            registerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
//        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
//    @objc private func loginButtonTapped() {
//        print("Login button tapped!")
//        // Add your login logic here
//    }
//
//    @objc private func registerButtonTapped() {
//        print("Register button tapped!")
//        // Add your register logic or navigate to another screen
//    }
}


