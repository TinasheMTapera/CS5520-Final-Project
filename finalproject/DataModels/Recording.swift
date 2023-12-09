//
//  Recording.swift
//  finalproject
//
//  Created by Diya on 12/5/23.
//

import Foundation

//object used to create and fetch user audio journals - used in RecordScreen
class Recording {
    
    var name: String
    var downloadURL: URL
    
    init(name: String, downloadURL: URL) {
        self.name = name
        self.downloadURL = downloadURL
    }
    
    
}
