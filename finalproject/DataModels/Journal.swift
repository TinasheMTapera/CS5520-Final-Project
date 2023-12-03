//
//  Journals.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import Foundation

class Journal {
    
    var journalID: String
    var title: String
    var content: String
    
    init(journalID: String, title: String, content: String) {
        self.journalID = journalID
        self.title = title
        self.content = content
    }
    
}
