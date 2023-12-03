//
//  JournalMainViewController.swift
//  finalproject
//
//  Created by Diya on 12/2/23.
//

import UIKit

class JournalMainViewController: UIViewController {
    
    let journalView = JournalMainView()
    
    override func loadView() {
        view = journalView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Journal"
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
