//
//  UserDetails.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import Foundation

class UserDetails {
    
    var name: String
    var email: String
    var journalCount: Int
    var audioCount: Int
    
    init(name: String, email: String, journalCount: Int, audioCount: Int) {
        self.name = name
        self.email = email
        self.journalCount = journalCount
        self.audioCount = audioCount
    }
    
}
