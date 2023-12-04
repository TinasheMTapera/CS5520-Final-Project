//
//  RecordScreenView.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import UIKit

class RecordScreenView: UIView {
    
    var recordButton: UIButton!
    var recordingsTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.backgroundColor
        
        setupRecordButton()
        setupRecordingsTableView()
        
        initConstraints()
    }
    
    func setupRecordButton() {
        
        recordButton = UIButton()
        recordButton.setImage(
            UIImage(systemName: "mic.fill")?.withConfiguration(UIImage.SymbolConfiguration(weight: .bold)).withRenderingMode(.alwaysOriginal).withTintColor(AppColors.greenButton),
            for: .normal)
        
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(recordButton)
    }
    
    func setupRecordingsTableView() {
        
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            
            recordButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            recordButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            recordButton.widthAnchor.constraint(equalToConstant: 30),
            recordButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
