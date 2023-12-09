//
//  RegistrationProgressIndicatorManager.swift
//  finalproject
//
//  Created by Diya on 11/29/23.
//

import Foundation

//loading symbol implementation
extension RegistrationViewController: ProgressSpinnerDelegate {
    
    func showActivityIndicator() {
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator() {
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
