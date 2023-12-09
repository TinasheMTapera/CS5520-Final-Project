//
//  AboutView.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/20/23.
//

import UIKit

import UIKit

class AboutScreenView: UIView {
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    var titleLabel: UILabel!
    var descriptionLabels: [UILabel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.backgroundColor
        
        setupScrollView()
        setupContentView()
        setupTitleLabel()
        setupDescriptionLabels()
        
        initConstraints()
    }
    
    func setupScrollView() {
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        
    }
    
    func setupContentView() {
        
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
    }
    
    func setupTitleLabel() {
        
        titleLabel = UILabel()
        titleLabel.text = "Welcome to MoodMaster"
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
    }
    
    func setupDescriptionLabels()  {
        
        let descriptions = [
            "Your personalized mood management companion designed for enhanced emotional well-being and productivity in the demanding realm of academia. Tailored to your unique needs, MoodMaster provides quick access to mood-enhancing stories, offering individualized emotional support for more effective learning experiences.",
            "MoodMaster's strength lies in recognizing the value of learning from others' experiences. Through a curated collection of short, personalized fictional stories, the app fosters a deep connection, helping users internalize valuable lessons during challenging times.",
            "Introducing an innovative audio journal feature, along with a written journal feature. MoodMaster harnesses the power of self-talk. Encouraging users to reflect and express positive affirmations, the app empowers a more optimistic mindset, recognizing the profound impact of self-affirmation.",
            "More than just an app, MoodMaster is your dedicated companion on the journey to emotional well-being and enhanced productivity. Embark on a journey of self-discovery, resilience, and positivity with MoodMaster. Elevate your mood, empower your thoughts, and embrace a more productive and fulfilling academic life. Download MoodMaster today and begin your personalized mood management experience – because your well-being is our priority."
        ]
        
        for (index, description) in descriptions.enumerated() {
            let descriptionLabel = UILabel()
            descriptionLabel.text = description
            descriptionLabel.numberOfLines = 0
            descriptionLabel.font = .systemFont(ofSize: 15)
            
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(descriptionLabel)
            descriptionLabels.append(descriptionLabel)
            
            // Add constraints for each description label
            if index == 0 {
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
            } else {
                descriptionLabel.topAnchor.constraint(equalTo: descriptionLabels[index - 1].bottomAnchor, constant: 10).isActive = true
            }
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        }
        
        // Set bottom constraint for the last descriptionLabel outside the loop
        if let lastDescriptionLabel = descriptionLabels.last {
            lastDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        }
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, constant: -40),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
