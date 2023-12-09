//
//  StoryListView.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import UIKit

class StoryListView: UIView {
    
    //variables used in view
    var titleLabel: UILabel!
    var tableViewStories: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.backgroundColor
        
        //UISetup
        setupTitleLabel()
        setupTableViewStories()
        
        initConstraints()
        
    }
    
    func setupTitleLabel() {
        
        titleLabel = UILabel()
        titleLabel.font = .boldSystemFont(ofSize: 15)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
    }
    
    func setupTableViewStories() {
        
        tableViewStories = UITableView()
        tableViewStories.register(StoryTableViewCell.self, forCellReuseIdentifier: TableIdentifiers.tableViewStories)
        
        tableViewStories.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewStories)
    }
    
    func initConstraints() {
        
        //UIConstraints and positioning
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            tableViewStories.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            tableViewStories.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            tableViewStories.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            tableViewStories.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
