//
//  NewJournalView.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import UIKit

class NewJournalView: UIView {
    
    var journalTitleTextField: UITextField!
    var journalTextView: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.backgroundColor
        
        setupJournalTitleTextField()
        setupJournalTextView()
        
        initConstraints()
    }
    
    func setupJournalTitleTextField() {
        
        journalTitleTextField = UITextField()
        journalTitleTextField.placeholder = "Title"
        
        journalTitleTextField.borderStyle = .roundedRect
        journalTitleTextField.layer.borderWidth = 2
        journalTitleTextField.layer.cornerRadius = 7.0
        
        journalTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(journalTitleTextField)
    }
    
    func setupJournalTextView() {
        
        journalTextView = UITextView()
        journalTextView.layer.borderWidth = 2
        journalTextView.layer.cornerRadius = 10.0
        
        journalTextView.isUserInteractionEnabled = true
        journalTextView.isSelectable = true
        journalTextView.isEditable = true
        
        journalTextView.keyboardType = .default
        journalTextView.returnKeyType = .done
        journalTextView.autocapitalizationType = .sentences
        journalTextView.dataDetectorTypes = .all
        
        journalTextView.autocorrectionType = UITextAutocorrectionType.yes
        journalTextView.spellCheckingType = UITextSpellCheckingType.yes
        
        
        journalTextView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(journalTextView)
    }
    
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            journalTitleTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -20),
            journalTitleTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            journalTitleTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            journalTitleTextField.heightAnchor.constraint(equalToConstant: 40),
            
            journalTextView.topAnchor.constraint(equalTo: journalTitleTextField.bottomAnchor, constant: 10),
            journalTextView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            journalTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            journalTextView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
