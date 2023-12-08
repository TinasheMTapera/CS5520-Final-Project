//
//  RecordingsTableViewCell.swift
//  finalproject
//
//  Created by Diya on 12/5/23.
//

import UIKit

class RecordingTableViewCell: UITableViewCell {
    
    var recordingNameLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupRecordingNameLabel()
        
        initConstraints()
    }
    
    func setupRecordingNameLabel() {
        
        recordingNameLabel = UILabel()
        recordingNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(recordingNameLabel)
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            
            recordingNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            recordingNameLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            recordingNameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            recordingNameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -55),
            recordingNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
        ])
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
