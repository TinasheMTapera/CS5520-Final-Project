//
//  JournalMainView.swift
//  finalproject
//
//  Created by Diya on 12/2/23.
//

import UIKit

class JournalMainView: UIView {
    
    var tableViewJournals: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.backgroundColor
        
        setupTableViewJournals()
        
        initConstraints()
    }
    
    func setupTableViewJournals() {
        tableViewJournals = UITableView()
        tableViewJournals.register(JournalTableViewCell.self, forCellReuseIdentifier: TableIdentifiers.tableViewJournals)
        
        tableViewJournals.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewJournals)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            tableViewJournals.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableViewJournals.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableViewJournals.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            tableViewJournals.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
