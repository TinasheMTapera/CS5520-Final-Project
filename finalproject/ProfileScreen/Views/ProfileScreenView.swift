//
//  ProfileScreenView.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import UIKit

class ProfileScreenView: UIView {

    var contentWrapper: UIScrollView!
    var boxView: UIView!
    
    var profileImage: UIImageView!
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var journalCountLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.whiteBackground
        
        setupContentWrapper()
        setupBoxView()
        setupProfileImage()
        setupNameLabel()
        setupEmailLabel()
        setupJournalContentLabel()
        
        initConstraints()
    }
    
    func setupContentWrapper() {
        
        contentWrapper = UIScrollView()
        
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupBoxView() {
        
        boxView = UIView()
        boxView.backgroundColor = AppColors.backgroundColor
        boxView.layer.cornerRadius = 6
        boxView.layer.shadowColor = UIColor.lightGray.cgColor
        boxView.layer.shadowOffset = .zero
        boxView.layer.shadowRadius = 4.0
        boxView.layer.shadowOpacity = 0.7
        
        boxView.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(boxView)
    }
    
    func setupProfileImage() {
        
        profileImage = UIImageView()
        profileImage.image = UIImage(systemName: "person.fill")
        profileImage.tintColor = .black
        profileImage.contentMode = .scaleAspectFit
        profileImage.clipsToBounds = true
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(profileImage)
        
        boxView.addSubview(profileImage)
    }
    
    func setupNameLabel() {
        
        nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 20)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        boxView.addSubview(nameLabel)
    }
    
    func setupEmailLabel() {
        
        emailLabel = UILabel()
        emailLabel.font = .boldSystemFont(ofSize: 20)
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        boxView.addSubview(emailLabel)
    }
    
    func setupJournalContentLabel() {
        
        journalCountLabel = UILabel()
        journalCountLabel.font = .boldSystemFont(ofSize: 15)
        
        journalCountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(journalCountLabel)
        
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            boxView.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 30),
            boxView.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            boxView.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, constant: -40),
            boxView.heightAnchor.constraint(equalTo: contentWrapper.heightAnchor, constant: -50),
            
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.widthAnchor.constraint(equalTo: boxView.widthAnchor),
            profileImage.topAnchor.constraint(equalTo: boxView.topAnchor, constant: 80),
            profileImage.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 80),
            nameLabel.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),

            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            emailLabel.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),
            
            journalCountLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 70),
            journalCountLabel.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
