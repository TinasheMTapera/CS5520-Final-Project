//
//  StoryTableViewCell.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var titleLabel: UILabel!
    var textPrompt: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupTitleLabel()
        setupTextPrompt()
        
        initConstraints()
        
    }
    
    func setupWrapperCellView() {
        wrapperCellView = UITableViewCell()
        wrapperCellView.backgroundColor = UIColor(red: 0.80, green: 0.93, blue: 0.99, alpha: 1.00)
        wrapperCellView.layer.borderColor = UIColor.black.cgColor
        
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(titleLabel)
    }
    
    func setupTextPrompt() {
        textPrompt = UILabel()
        textPrompt.font = UIFont.systemFont(ofSize: 14)
        
        textPrompt.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(textPrompt)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            titleLabel.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor),
            
            textPrompt.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 30),
            textPrompt.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            textPrompt.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -10),
            textPrompt.heightAnchor.constraint(equalToConstant: 20),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 70),
            
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
