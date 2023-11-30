//
//  AboutView.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/20/23.
//

import UIKit

class AboutView: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "MoodMaster"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Mood fluctuations can disrupt students' concentration, engagement, and motivation, affecting their academic performance. To counter this, MoodMaster, a personalized mood management app, offers emotional support features to help stabilize the user's emotional state, leading to more effective learning."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .justified
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1.0)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1.0)
    }

    private func setupViews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20)
        ])
    }

}

