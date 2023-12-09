//
//  RegisterView.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.
//

import UIKit

class RegistrationView: UIView {
    
    //variables used in view
    var contentWrapper: UIScrollView!
    var profilePictureButton: UIButton!
    var profilePicturePromptLabel: UILabel!
    var nameLabel: UILabel!
    var nameTextField: UITextField!
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var reenterPasswordLabel: UILabel!
    var reenterPasswordTextField: UITextField!
    var createProfileButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.backgroundColor
        
        //UISetup
        setupContentWrapper()
        setupProfilePictureButton()
        setupProfilePicturePromptLabel()
        setupNameLabel()
        setupNameTextField()
        setupEmailLabel()
        setupEmailTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupReenterPasswordLabel()
        setupReenterPasswordTextField()
        setupCreateProfileButton()
        
        initConstraints()
    }
    
    func setupContentWrapper() {
        
        contentWrapper = UIScrollView()
        
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupProfilePictureButton() {
        
        profilePictureButton = UIButton(type: .system)
        profilePictureButton.setTitle("", for: .normal)
        profilePictureButton.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        profilePictureButton.tintColor = AppColors.blueButton
        profilePictureButton.contentHorizontalAlignment = .fill
        profilePictureButton.contentVerticalAlignment = .fill
        profilePictureButton.imageView?.contentMode = .scaleAspectFit
        profilePictureButton.showsMenuAsPrimaryAction = true
        profilePictureButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(profilePictureButton)
        
    }
    
    func setupProfilePicturePromptLabel() {
        
        profilePicturePromptLabel = UILabel()
        profilePicturePromptLabel.text = "Profile Picture"
        profilePicturePromptLabel.font = .boldSystemFont(ofSize: 15)
        
        profilePicturePromptLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(profilePicturePromptLabel)
    }
    
    func setupNameLabel() {
        
        nameLabel = UILabel()
        nameLabel.text = "Name:"
        nameLabel.font = .boldSystemFont(ofSize: 17)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(nameLabel)
    }
    
    func setupNameTextField() {
        
        nameTextField = UITextField()
        nameTextField.placeholder = "Enter your name"
        nameTextField.borderStyle = .roundedRect
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(nameTextField)
    }
    
    func setupEmailLabel() {
        
        emailLabel = UILabel()
        emailLabel.text = "Email:"
        emailLabel.font = .boldSystemFont(ofSize: 17)
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(emailLabel)
    }
    
    func setupEmailTextField() {
        
        emailTextField = UITextField()
        emailTextField.placeholder = "Enter your email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(emailTextField)
    }
    
    func setupPasswordLabel() {
        
        passwordLabel = UILabel()
        passwordLabel.text = "Password:"
        passwordLabel.font = .boldSystemFont(ofSize: 17)
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(passwordLabel)
    }
    
    func setupPasswordTextField() {
        
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(passwordTextField)
    }
    
    func setupReenterPasswordLabel() {
        
        reenterPasswordLabel = UILabel()
        reenterPasswordLabel.text = "Confirm Password:"
        reenterPasswordLabel.font = .boldSystemFont(ofSize: 17)
        
        reenterPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(reenterPasswordLabel)
    }
    
    func setupReenterPasswordTextField() {
        
        reenterPasswordTextField = UITextField()
        reenterPasswordTextField.placeholder = "Re-enter your password"
        reenterPasswordTextField.borderStyle = .roundedRect
        reenterPasswordTextField.isSecureTextEntry = true
        
        reenterPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(reenterPasswordTextField)
    }
    
    func setupCreateProfileButton() {
        
        createProfileButton = UIButton(type: .system)
        createProfileButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        createProfileButton.setTitle("Create Account", for: .normal)
        createProfileButton.backgroundColor = .systemGreen
        createProfileButton.setTitleColor(.white, for: .normal)
        createProfileButton.layer.cornerRadius = 6
        
        createProfileButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(createProfileButton)
    }
    
    func initConstraints() {
        
        //UIConstraints and positioning
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            profilePictureButton.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
            profilePictureButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            profilePictureButton.widthAnchor.constraint(equalToConstant: 150),
            profilePictureButton.heightAnchor.constraint(equalToConstant: 150),
            
            profilePicturePromptLabel.topAnchor.constraint(equalTo: profilePictureButton.bottomAnchor, constant: 10),
            profilePicturePromptLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: profilePicturePromptLabel.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 10),
            nameTextField.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, constant: -25),
            
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 10),
            emailTextField.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, constant: -25),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 10),
            passwordTextField.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, constant: -25),
            
            reenterPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            reenterPasswordLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
            
            reenterPasswordTextField.topAnchor.constraint(equalTo: reenterPasswordLabel.bottomAnchor, constant: 10),
            reenterPasswordTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 10),
            reenterPasswordTextField.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, constant: -25),
            
            createProfileButton.topAnchor.constraint(equalTo: reenterPasswordTextField.bottomAnchor, constant: 50),
            createProfileButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            createProfileButton.widthAnchor.constraint(equalToConstant: 150),
            createProfileButton.heightAnchor.constraint(equalToConstant: 50),
            createProfileButton.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -10),
            
            //            contentWrapper.heightAnchor.constraint(equalToConstant: 700),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

