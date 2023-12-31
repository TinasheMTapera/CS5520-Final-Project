//
//  UIImageExtension.swift
//  finalproject
//
//  Created by Diya on 12/3/23.
//

import Foundation
import UIKit

//used to fetch the profile photo uploaded by a user and render it to display in ProfileScreen
extension UIImage {
    
    func resize(targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { (context) in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}

extension UIImageView {
    
    func loadRemoteImage(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
