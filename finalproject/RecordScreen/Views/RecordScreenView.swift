//
//  RecordScreenView.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import UIKit

class RecordScreenView: UIView {
    
    var recordButton: UIButton!
    var recordPromptLabel: UILabel!
    var emptyStateLabel: UILabel!
    var tableViewRecordings: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.backgroundColor
        
        setupRecordButton()
        setupRecordPromptLabel()
        setupEmptyStateLabel()
        setupTableViewRecordings()
        
        initConstraints()
    }
    
    
    func setupRecordButton() {
        
        recordButton = UIButton()
        
        
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        let boldMicImage = UIImage(systemName: "mic.fill", withConfiguration: boldConfiguration)
        
        recordButton.setImage(boldMicImage, for: .normal)
        recordButton.imageView?.contentMode = .scaleAspectFit // or any other content mode that fits your layout
        recordButton.tintColor = AppColors.whiteBackground
        
        recordButton.backgroundColor = AppColors.greenButton
        recordButton.layer.cornerRadius = 15
        recordButton.layer.shadowColor = UIColor.darkGray.cgColor
        recordButton.layer.shadowOpacity = 0.5
        recordButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        recordButton.layer.shadowRadius = 4
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(recordButton)
    }
    
    func setupRecordPromptLabel() {
        
        recordPromptLabel = UILabel()
        recordPromptLabel.text = "Record a new audio"
        recordPromptLabel.font = .boldSystemFont(ofSize: 15)
        
        recordPromptLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(recordPromptLabel)
    }
    
    func setupEmptyStateLabel() {
        
        emptyStateLabel = UILabel()
        emptyStateLabel.text = "You have no recordings yet"
        emptyStateLabel.textColor = .gray
        
        emptyStateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emptyStateLabel)
    }
    
    func setupTableViewRecordings() {
        
        tableViewRecordings = UITableView()
        tableViewRecordings.register(RecordingTableViewCell.self, forCellReuseIdentifier: TableIdentifiers.tableViewRecordings)
        tableViewRecordings.backgroundColor = UIColor.clear
        
        tableViewRecordings.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewRecordings)
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            
            recordButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            recordButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            recordButton.widthAnchor.constraint(equalToConstant: 60),
            recordButton.heightAnchor.constraint(equalToConstant: 60),
            
            recordPromptLabel.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 20),
            recordPromptLabel.centerXAnchor.constraint(equalTo: recordButton.centerXAnchor),
            
            tableViewRecordings.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 50),
            tableViewRecordings.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableViewRecordings.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableViewRecordings.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            emptyStateLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            emptyStateLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
