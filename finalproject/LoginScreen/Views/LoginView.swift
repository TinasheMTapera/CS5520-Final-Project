//
//  MainView.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.
//

import UIKit

class LoginView: UIView {
    
    //variables used in view
    var contentWrapper: UIScrollView!
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
        
        //UISetup
        setupContentWrapper()
        setupLogoImageView()
        setupAppNameLabel()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupRegisterPromptLabel()
        setupRegisterButton()
        
        initConstraints()
    }
    
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.backgroundColor = .clear
        
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupLogoImageView() {
        logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "transparentlogo")
        logoImageView.contentMode = .scaleAspectFit
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(logoImageView)
    }
    
    func setupAppNameLabel() {
        appNameLabel = UILabel()
        appNameLabel.text = "MoodMaster"
        appNameLabel.textAlignment = .center
        appNameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        appNameLabel.textColor = UIColor(named: "AppNameColor")
        
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(appNameLabel)
    }
    
    func setupEmailTextField() {
        emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(emailTextField)
    }
    
    func setupPasswordTextField() {
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(passwordTextField)
    }
    
    func setupLoginButton() {
        loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = AppColors.blueButton
        loginButton.layer.cornerRadius = 8
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(loginButton)
    }
    
    func setupRegisterPromptLabel() {
        registerPromptLabel = UILabel()
        registerPromptLabel.text = "Signup with MoodMaster"
        registerPromptLabel.textAlignment = .center
        registerPromptLabel.textColor = .gray
        registerPromptLabel.numberOfLines = 0
        
        registerPromptLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(registerPromptLabel)
    }
    
    func setupRegisterButton() {
        registerButton = UIButton()
        registerButton.setTitle("Register", for: .normal)
        registerButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.backgroundColor = AppColors.greenButton
        registerButton.layer.cornerRadius = 8
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(registerButton)
    }
    
    func initConstraints() {
        
        //UIConstraints and positioning
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            appNameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
            appNameLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 60),
            emailTextField.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            loginButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerPromptLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 70),
            registerPromptLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            registerPromptLabel.widthAnchor.constraint(equalToConstant: 250),
            
            registerButton.topAnchor.constraint(equalTo: registerPromptLabel.bottomAnchor, constant: 30),
            registerButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 120),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
            
        ])
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


