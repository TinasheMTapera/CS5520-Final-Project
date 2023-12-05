//
//  Story.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import Foundation

class Snippet: Decodable {
    
    var title: String
    var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}
