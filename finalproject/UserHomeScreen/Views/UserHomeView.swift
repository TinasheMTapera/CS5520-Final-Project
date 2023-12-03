//
//  OptionView.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.

import UIKit

class UserHomeView : UIView {
    
    var textLabel: UILabel!
    var readSomethingButton: UIButton!
    var journalButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.backgroundColor

        setupTextLabel()
        setupReadSomethingButton()
        setupJournalButton()

        initConstraints()
    }

    func setupTextLabel() {
        textLabel = UILabel()
        textLabel.text = "How do you wish to handle your mood today?"
        textLabel.font = .boldSystemFont(ofSize: 16)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textLabel)
    }
    
    func setupReadSomethingButton() {
        readSomethingButton = UIButton(type: .system)
        readSomethingButton.setTitle("Read Something", for: .normal)
        
        readSomethingButton.setTitleColor(.white, for: .normal)
        readSomethingButton.backgroundColor = AppColors.buttonColor
            readSomethingButton.layer.cornerRadius = 15
            readSomethingButton.layer.shadowColor = UIColor.darkGray.cgColor
            readSomethingButton.layer.shadowOpacity = 0.5
            readSomethingButton.layer.shadowOffset = CGSize(width: 0, height: 3)
            readSomethingButton.layer.shadowRadius = 4
            readSomethingButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        readSomethingButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(readSomethingButton)
    }
    
    func setupJournalButton() {
        journalButton = UIButton(type: .system)
        journalButton.setTitle("Journal my thoughts", for: .normal)
        
        journalButton.setTitleColor(.white, for: .normal)
        journalButton.backgroundColor = AppColors.buttonColor
            journalButton.layer.cornerRadius = 15
            journalButton.layer.shadowColor = UIColor.darkGray.cgColor
            journalButton.layer.shadowOpacity = 0.5
            journalButton.layer.shadowOffset = CGSize(width: 0, height: 3)
            journalButton.layer.shadowRadius = 4
            journalButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        journalButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(journalButton)
    }
    
    
    func initConstraints() {

        NSLayoutConstraint.activate([
            
            textLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),
            textLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            readSomethingButton.topAnchor.constraint(equalTo: textLabel.topAnchor, constant: 100),
            readSomethingButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            readSomethingButton.widthAnchor.constraint(equalToConstant: 200),
            readSomethingButton.heightAnchor.constraint(equalToConstant: 70),

            journalButton.topAnchor.constraint(equalTo: readSomethingButton.bottomAnchor, constant: 100),
            journalButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            journalButton.widthAnchor.constraint(equalToConstant: 200),
            journalButton.heightAnchor.constraint(equalToConstant: 70),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
