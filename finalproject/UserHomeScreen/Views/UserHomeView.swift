//
//  OptionView.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.

import UIKit

class UserHomeView : UIView {
    
    //variables used in view
    var contentWrapper: UIScrollView!
    var textLabel: UILabel!
    var readStoriesButton: UIButton!
    var writeJournalButton: UIButton!
    var recordMomentsButton: UIButton!
    var logoutButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.backgroundColor
        
        //UISetup
        setupContentWrapper()
        setupTextLabel()
        setupReadStoriesButton()
        setupWriteJournalButton()
        setupRecordMomentsButton()
        setupLogoutButton()
        
        initConstraints()
    }
    
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.backgroundColor = .clear
        
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupTextLabel() {
        textLabel = UILabel()
        textLabel.text = "How do you wish to handle your mood today?"
        textLabel.font = .boldSystemFont(ofSize: 16)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textLabel)
    }
    
    func setupReadStoriesButton() {
        
        readStoriesButton = UIButton(type: .system)
        readStoriesButton.setTitle("Inspirational Picks", for: .normal)
        
        readStoriesButton.setTitleColor(.white, for: .normal)
        readStoriesButton.backgroundColor = AppColors.blueButton
        readStoriesButton.layer.cornerRadius = 15
        readStoriesButton.layer.shadowColor = UIColor.darkGray.cgColor
        readStoriesButton.layer.shadowOpacity = 0.5
        readStoriesButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        readStoriesButton.layer.shadowRadius = 4
        readStoriesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        readStoriesButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(readStoriesButton)
    }
    
    func setupWriteJournalButton() {
        
        writeJournalButton = UIButton(type: .system)
        writeJournalButton.setTitle("Express Yourself", for: .normal)
        
        writeJournalButton.setTitleColor(.white, for: .normal)
        writeJournalButton.backgroundColor = AppColors.blueButton
        writeJournalButton.layer.cornerRadius = 15
        writeJournalButton.layer.shadowColor = UIColor.darkGray.cgColor
        writeJournalButton.layer.shadowOpacity = 0.5
        writeJournalButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        writeJournalButton.layer.shadowRadius = 4
        writeJournalButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        writeJournalButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(writeJournalButton)
    }
    
    func setupRecordMomentsButton() {
        
        recordMomentsButton = UIButton(type: .system)
        recordMomentsButton.setTitle("Record Moments", for: .normal)
        
        recordMomentsButton.setTitleColor(.white, for: .normal)
        recordMomentsButton.backgroundColor = AppColors.blueButton
        recordMomentsButton.layer.cornerRadius = 15
        recordMomentsButton.layer.shadowColor = UIColor.darkGray.cgColor
        recordMomentsButton.layer.shadowOpacity = 0.5
        recordMomentsButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        recordMomentsButton.layer.shadowRadius = 4
        recordMomentsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        recordMomentsButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(recordMomentsButton)
        
    }
    
    func setupLogoutButton() {
        
        logoutButton = UIButton(type: .system)
        logoutButton.setTitle("Logout", for: .normal)
        
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.backgroundColor = AppColors.redButton
        logoutButton.layer.cornerRadius = 15
        logoutButton.layer.shadowColor = UIColor.darkGray.cgColor
        logoutButton.layer.shadowOpacity = 0.5
        logoutButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        logoutButton.layer.shadowRadius = 4
        logoutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(logoutButton)
    }
    
    func initConstraints() {
        
        //UIConstraints and positioning
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            textLabel.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 70),
            textLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 30),
            
            readStoriesButton.topAnchor.constraint(equalTo: textLabel.topAnchor, constant: 80),
            readStoriesButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            readStoriesButton.widthAnchor.constraint(equalToConstant: 200),
            readStoriesButton.heightAnchor.constraint(equalToConstant: 70),
            
            writeJournalButton.topAnchor.constraint(equalTo: readStoriesButton.bottomAnchor, constant: 50),
            writeJournalButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            writeJournalButton.widthAnchor.constraint(equalToConstant: 200),
            writeJournalButton.heightAnchor.constraint(equalToConstant: 70),
            
            recordMomentsButton.topAnchor.constraint(equalTo: writeJournalButton.bottomAnchor, constant: 50),
            recordMomentsButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            recordMomentsButton.widthAnchor.constraint(equalToConstant: 200),
            recordMomentsButton.heightAnchor.constraint(equalToConstant: 70),
            
            logoutButton.bottomAnchor.constraint(equalTo: recordMomentsButton.bottomAnchor, constant: 200),
            logoutButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: 220),
            logoutButton.heightAnchor.constraint(equalToConstant: 50),
            logoutButton.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
