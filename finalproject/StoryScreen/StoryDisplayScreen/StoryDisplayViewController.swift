//
//  StoryDisplayViewController.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import UIKit

class StoryDisplayViewController: UIViewController {
    
    let storyDisplayView = StoryDisplayView()
    
    override func loadView() {
        view = storyDisplayView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
