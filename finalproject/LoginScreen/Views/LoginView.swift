//
//  MainView.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.
//

import UIKit

class LoginView: UIView {
    
    var logoImageView: UIImageView!
    var appNameLabel: UILabel!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    var registerPromptLabel: UILabel!
    var registerButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.backgroundColor
        
        setupLogoImageView()
        setupAppNameLabel()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupRegisterPromptLabel()
        setupRegisterButton()
        
        initConstraints()
    }

    
    func setupLogoImageView() {
        logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "transparentlogo")
        logoImageView.contentMode = .scaleAspectFit
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logoImageView)
    }
    
    func setupAppNameLabel() {
        appNameLabel = UILabel()
        appNameLabel.text = "MoodMaster"
        appNameLabel.textAlignment = .center
        appNameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        appNameLabel.textColor = UIColor(named: "AppNameColor")
        
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(appNameLabel)
    }
    
    func setupEmailTextField() {
        emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailTextField)
    }
    
    func setupPasswordTextField() {
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passwordTextField)
    }
    
    func setupLoginButton() {
        loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.layer.cornerRadius = 8
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginButton)
    }
    
    func setupRegisterPromptLabel() {
        registerPromptLabel = UILabel()
        registerPromptLabel.text = "Signup with MoodMaster"
        registerPromptLabel.textAlignment = .center
        registerPromptLabel.textColor = .gray
        registerPromptLabel.numberOfLines = 0
        
        registerPromptLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(registerPromptLabel)
    }
    
    func setupRegisterButton() {
        registerButton = UIButton()
        registerButton.setTitle("Register", for: .normal)
        registerButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.backgroundColor = .systemGreen
        registerButton.layer.cornerRadius = 8
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(registerButton)
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            appNameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
            appNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 60),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerPromptLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 70),
            registerPromptLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerPromptLabel.widthAnchor.constraint(equalToConstant: 250),
            
            registerButton.topAnchor.constraint(equalTo: registerPromptLabel.bottomAnchor, constant: 30),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 120),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


