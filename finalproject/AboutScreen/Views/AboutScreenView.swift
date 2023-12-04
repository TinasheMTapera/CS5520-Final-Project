//
//  AboutView.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/20/23.
//

import UIKit

class AboutScreenView: UIView {
    
    //    var contentWrapper: UIScrollView!
    //    var titleLabel: UILabel!
    //    var descriptionLabel1: UILabel!
    //    var descriptionLabel2: UILabel!
    //    var descriptionLabel3: UILabel!
    //    var descriptionLabel4: UILabel!
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    var titleLabel: UILabel!
    var descriptionLabels: [UILabel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.backgroundColor
        
        //        setupContentWrapper()
        //        setupTitleLabel()
        //        setupDescriptionLabel1()
        //        setupDescriptionLabel2()
        //        setupDescriptionLabel3()
        //        setupDescriptionLabel4()
        
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
    }
    
    
    //    func setupContentWrapper() {
    //
    //        contentWrapper = UIScrollView()
    //
    //        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
    //        self.addSubview(contentWrapper)
    //    }
    //
    //    func setupTitleLabel() {
    //
    //        titleLabel = UILabel()
    //        titleLabel.text = "Welcome to MoodMaster"
    //        titleLabel.font = .boldSystemFont(ofSize: 25)
    //
    //
    //        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    //        contentWrapper.addSubview(titleLabel)
    //    }
    //
    //    func setupDescriptionLabel1() {
    //
    //        descriptionLabel1 = UILabel()
    //        descriptionLabel1.text = "Your personalized mood management companion designed for enhanced emotional well-being and productivity in the demanding realm of academia. Tailored to your unique needs, MoodMaster provides quick access to mood-enhancing stories, offering individualized emotional support for more effective learning experiences."
    //        descriptionLabel1.numberOfLines = 0
    //        descriptionLabel1.font = .systemFont(ofSize: 15)
    //
    //        let paragraphStyle = NSMutableParagraphStyle()
    //        paragraphStyle.lineSpacing = 8
    //        paragraphStyle.alignment = .justified
    //
    //        // Set the attributed text with the paragraph style
    //        let attributedText = NSAttributedString(string: descriptionLabel1.text ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    //
    //        descriptionLabel1.attributedText = attributedText
    //
    //        descriptionLabel1.translatesAutoresizingMaskIntoConstraints = false
    //        contentWrapper.addSubview(descriptionLabel1)
    //
    //    }
    //
    //    func setupDescriptionLabel2() {
    //
    //        descriptionLabel2 = UILabel()
    //        descriptionLabel2.text = "MoodMaster's strength lies in recognizing the value of learning from others' experiences. Through a curated collection of short, personalized fictional stories, the app fosters a deep connection, helping users internalize valuable lessons during challenging times."
    //        descriptionLabel2.numberOfLines = 0
    //        descriptionLabel2.font = .systemFont(ofSize: 15)
    //
    //        let paragraphStyle = NSMutableParagraphStyle()
    //        paragraphStyle.lineSpacing = 8
    //        paragraphStyle.alignment = .justified
    //
    //        // Set the attributed text with the paragraph style
    //        let attributedText = NSAttributedString(string: descriptionLabel2.text ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    //
    //        descriptionLabel2.attributedText = attributedText
    //
    //        descriptionLabel2.translatesAutoresizingMaskIntoConstraints = false
    //        contentWrapper.addSubview(descriptionLabel2)
    //
    //    }
    //
    //    func setupDescriptionLabel3() {
    //
    //        descriptionLabel3 = UILabel()
    //        descriptionLabel3.text = "Introducing an innovative audio journal feature, along with a written journal feature. MoodMaster harnesses the power of self-talk. Encouraging users to reflect and express positive affirmations, the app empowers a more optimistic mindset, recognizing the profound impact of self-affirmation."
    //        descriptionLabel3.numberOfLines = 0
    //        descriptionLabel3.font = .systemFont(ofSize: 15)
    //
    //        let paragraphStyle = NSMutableParagraphStyle()
    //        paragraphStyle.lineSpacing = 8
    //        paragraphStyle.alignment = .justified
    //
    //        // Set the attributed text with the paragraph style
    //        let attributedText = NSAttributedString(string: descriptionLabel3.text ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    //
    //        descriptionLabel3.attributedText = attributedText
    //
    //        descriptionLabel3.translatesAutoresizingMaskIntoConstraints = false
    //        contentWrapper.addSubview(descriptionLabel3)
    //
    //    }
    //
    //    func setupDescriptionLabel4() {
    //
    //        descriptionLabel4 = UILabel()
    //        descriptionLabel4.text = "More than just an app, MoodMaster is your dedicated companion on the journey to emotional well-being and enhanced productivity. Embark on a journey of self-discovery, resilience, and positivity with MoodMaster. Elevate your mood, empower your thoughts, and embrace a more productive and fulfilling academic life. Download MoodMaster today and begin your personalized mood management experience – because your well-being is our priority."
    //        descriptionLabel4.numberOfLines = 0
    //        descriptionLabel4.font = .systemFont(ofSize: 15)
    //
    //        let paragraphStyle = NSMutableParagraphStyle()
    //        paragraphStyle.lineSpacing = 8
    //        paragraphStyle.alignment = .justified
    //
    //        // Set the attributed text with the paragraph style
    //        let attributedText = NSAttributedString(string: descriptionLabel4.text ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    //
    //        descriptionLabel4.attributedText = attributedText
    //
    //        descriptionLabel4.translatesAutoresizingMaskIntoConstraints = false
    //        contentWrapper.addSubview(descriptionLabel4)
    //
    //    }
    //
    //    func initConstraints() {
    //
    //        NSLayoutConstraint.activate([
    //
    //            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
    //            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
    //            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    //            contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
    //
    //            titleLabel.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
    //            titleLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
    //            titleLabel.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor),
    //
    //            descriptionLabel1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
    //            descriptionLabel1.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
    //            descriptionLabel1.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor),
    //
    //            descriptionLabel2.topAnchor.constraint(equalTo: descriptionLabel1.bottomAnchor, constant: 10),
    //            descriptionLabel2.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
    //            descriptionLabel2.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor),
    //
    //            descriptionLabel3.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: 10),
    //            descriptionLabel3.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
    //            descriptionLabel3.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor),
    //
    //            descriptionLabel4.topAnchor.constraint(equalTo: descriptionLabel3.bottomAnchor, constant: 10),
    //            descriptionLabel4.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
    //            descriptionLabel4.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor),
    //
    //        ])
    //
    //        let totalHeight = titleLabel.frame.height +
    //                              descriptionLabel1.frame.height +
    //                              descriptionLabel2.frame.height +
    //                              descriptionLabel3.frame.height +
    //                              descriptionLabel4.frame.height +
    //                              30 +  // Extra spacing between labels
    //                              20    // Bottom spacing
    //
    //            contentWrapper.contentSize = CGSize(width: self.frame.width - 40, height: totalHeight)
    //
    //    }
    
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
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

