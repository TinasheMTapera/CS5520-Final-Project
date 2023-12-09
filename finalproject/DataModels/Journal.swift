//
//  Journals.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import Foundation

//object for writtenJournal creations - used in creation and fetching of user journals
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

//enum to differentiate between create and update actions
enum JournalAction {
    case create
    case edit(journalID: String)
}

