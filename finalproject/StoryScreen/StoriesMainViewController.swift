//
//  StoriesMainViewController.swift
//  finalproject
//
//  Created by Diya on 12/2/23.
//

import UIKit

class StoriesMainViewController: UIViewController {
    
    let storyView = StoriesMainView()
    
    override func loadView() {
        view = storyView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Stories"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
