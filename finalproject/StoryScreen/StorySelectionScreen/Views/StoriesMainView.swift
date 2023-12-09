//
//  StoriesMainView.swift
//  finalproject
//
//  Created by Diya on 12/2/23.
//

import UIKit

class StoriesMainView: UIView {
    
    //variables used in view
    var contentWrapper: UIScrollView!
    
    var moodCategoriesBoxView : UIView!
    var moodCategoryTitleLabel: UILabel!
    var moodPickerButton: UIPickerView!
    
    var timeframeBoxView: UIView!
    var timeframeTitleLabel: UILabel!
    var timeframePickerButton: UIPickerView!
    
    var goArrowButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.whiteBackground
        
        //UISetup
        setupContentWrapper()
        
        setupMoodCategoriesBoxView()
        setupMoodCategoryTitleLabel()
        setupMoodPickerButton()
        
        setupTimeframeBoxView()
        setupTimeframeTitleLabel()
        setupTimeframePickerButton()
        
        setupGoArrowButton()
        
        initConstraints()
    }
    
    func setupContentWrapper() {
        
        contentWrapper = UIScrollView()
        
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
        
    }
    
    func setupMoodCategoriesBoxView() {
        
        moodCategoriesBoxView = UIView()
        moodCategoriesBoxView.backgroundColor = AppColors.backgroundColor
        moodCategoriesBoxView.layer.cornerRadius = 6
        moodCategoriesBoxView.layer.shadowColor = UIColor.lightGray.cgColor
        moodCategoriesBoxView.layer.shadowOffset = .zero
        moodCategoriesBoxView.layer.shadowRadius = 4.0
        moodCategoriesBoxView.layer.shadowOpacity = 0.7
        
        moodCategoriesBoxView.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(moodCategoriesBoxView)
        
    }
    
    func setupMoodCategoryTitleLabel() {
        
        moodCategoryTitleLabel = UILabel()
        moodCategoryTitleLabel.text = "I want to feel"
        moodCategoryTitleLabel.font = .boldSystemFont(ofSize: 20)
        
        moodCategoryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        moodCategoriesBoxView.addSubview(moodCategoryTitleLabel)
        
    }
    
    func setupMoodPickerButton() {
        
        moodPickerButton = UIPickerView()
        moodPickerButton.isUserInteractionEnabled = true
        
        moodPickerButton.translatesAutoresizingMaskIntoConstraints = false
        moodCategoriesBoxView.addSubview(moodPickerButton)
        
    }
    
    func setupTimeframeBoxView() {
        
        timeframeBoxView = UIView()
        timeframeBoxView.backgroundColor = AppColors.backgroundColor
        timeframeBoxView.layer.cornerRadius = 6
        timeframeBoxView.layer.shadowColor = UIColor.lightGray.cgColor
        timeframeBoxView.layer.shadowOffset = .zero
        timeframeBoxView.layer.shadowRadius = 4.0
        timeframeBoxView.layer.shadowOpacity = 0.7
        
        timeframeBoxView.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(timeframeBoxView)
        
    }
    
    func setupTimeframeTitleLabel() {
        
        timeframeTitleLabel = UILabel()
        timeframeTitleLabel.text = "Over the next"
        timeframeTitleLabel.font = .boldSystemFont(ofSize: 20)
        
        timeframeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        timeframeBoxView.addSubview(timeframeTitleLabel)
        
    }
    
    func setupTimeframePickerButton() {
        
        timeframePickerButton = UIPickerView()
        timeframePickerButton.isUserInteractionEnabled = true
        
        timeframePickerButton.translatesAutoresizingMaskIntoConstraints = false
        timeframeBoxView.addSubview(timeframePickerButton)
        
    }
    
    func setupGoArrowButton() {
        
        goArrowButton = UIButton(type: .system)
        goArrowButton.setTitle("", for: .normal)
        
        //customizing image on button
        if let boldArrowImage = UIImage(systemName: "arrow.forward")?.withTintColor(AppColors.whiteBackground).withRenderingMode(.alwaysOriginal) {
            
            let boldConfiguration = UIImage.SymbolConfiguration(weight: .bold)
            let boldArrow = boldArrowImage.applyingSymbolConfiguration(boldConfiguration)
            
            goArrowButton.setImage(boldArrow, for: .normal)
        }
        
        goArrowButton.backgroundColor = AppColors.greenButton
        goArrowButton.layer.cornerRadius = 15
        goArrowButton.layer.shadowColor = UIColor.darkGray.cgColor
        goArrowButton.layer.shadowOpacity = 0.5
        goArrowButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        goArrowButton.layer.shadowRadius = 4
        
        goArrowButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(goArrowButton)
    }
    
    func initConstraints() {
        
        //UIConstraints and positioning
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            moodCategoriesBoxView.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 20),
            moodCategoriesBoxView.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 50),
            moodCategoriesBoxView.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, constant: -100),
            moodCategoriesBoxView.heightAnchor.constraint(equalToConstant: 250),
            
            moodCategoryTitleLabel.topAnchor.constraint(equalTo: moodCategoriesBoxView.topAnchor, constant: 20),
            moodCategoryTitleLabel.centerXAnchor.constraint(equalTo: moodCategoriesBoxView.centerXAnchor),
            
            moodPickerButton.topAnchor.constraint(equalTo: moodCategoryTitleLabel.bottomAnchor),
            moodPickerButton.centerXAnchor.constraint(equalTo: moodCategoriesBoxView.centerXAnchor),
            moodPickerButton.widthAnchor.constraint(lessThanOrEqualTo: moodCategoriesBoxView.widthAnchor),
            
            timeframeBoxView.topAnchor.constraint(equalTo: moodCategoriesBoxView.bottomAnchor, constant: 40),
            timeframeBoxView.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 50),
            timeframeBoxView.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, constant: -100),
            timeframeBoxView.heightAnchor.constraint(equalToConstant: 250),
            
            timeframeTitleLabel.topAnchor.constraint(equalTo: timeframeBoxView.topAnchor, constant: 20),
            timeframeTitleLabel.centerXAnchor.constraint(equalTo: timeframeBoxView.centerXAnchor),
            
            timeframePickerButton.topAnchor.constraint(equalTo: timeframeTitleLabel.bottomAnchor),
            timeframePickerButton.centerXAnchor.constraint(equalTo: timeframeBoxView.centerXAnchor),
            timeframePickerButton.widthAnchor.constraint(lessThanOrEqualTo: timeframeBoxView.widthAnchor),
            
            goArrowButton.topAnchor.constraint(equalTo: timeframeBoxView.bottomAnchor, constant: 40),
            goArrowButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            goArrowButton.widthAnchor.constraint(equalToConstant: 100), // Adjust the width as needed
            goArrowButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
