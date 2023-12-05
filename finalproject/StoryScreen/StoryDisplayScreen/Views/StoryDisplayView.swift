//
//  StoryDisplayView.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import UIKit

class StoryDisplayView: UIView {
    
    var contentWrapper: UIScrollView!
    var titleLabel: UILabel!
    var contentLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.backgroundColor
        
        setupContentWrapper()
        setupTitleLabel()
        setupContentLabel()
        
        initConstraints()
    }
    
    func setupContentWrapper() {
        
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupTitleLabel() {
        
        titleLabel = UILabel()
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(titleLabel)
    }
    
    func setupContentLabel() {
        
        contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8 // Adjust the value as needed
        
        // Set up attributed text with line spacing
        let attributedString = NSAttributedString(
            string: "Your text goes here.",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        
        contentLabel.attributedText = attributedString
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(contentLabel)
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            contentLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            contentLabel.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            contentLabel.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -20),
            contentLabel.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, constant: -40),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
