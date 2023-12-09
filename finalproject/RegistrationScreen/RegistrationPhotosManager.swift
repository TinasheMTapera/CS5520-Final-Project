//
//  RegistrationPhotosManager.swift
//  finalproject
//
//  Created by Diya on 12/5/23.
//

import Foundation
import UIKit
import PhotosUI

//implementation for user profilePicture
extension RegistrationViewController: PHPickerViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //show menu on clicking photo icon/button on registration screen
    func getMenuImagePicker() -> UIMenu{
        
        print("Entering getMenuImagePicker")
        
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        print("Exiting getMenuImagePicker")
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //take a photo using Camera
    func pickUsingCamera(){
        
        print("Entered pickUsingCamera")
        
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
        
        print("Exiting pickUsingCamera")
    }
    
    //pick a photo using Gallery
    func pickPhotoFromGallery(){
        
        print("Entered pickPhotoFromGallery")
        
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
        
        print("Exiting pickPhotoFromGallery")
    }
    
    //picker functionality
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(
                    ofClass: UIImage.self,
                    completionHandler: { (image, error) in
                        DispatchQueue.main.async{
                            if let uwImage = image as? UIImage{
                                self.registerView.profilePictureButton.setImage(
                                    uwImage.withRenderingMode(.alwaysOriginal),
                                    for: .normal
                                )
                                self.pickedImage = uwImage
                            }
                        }
                    }
                )
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.registerView.profilePictureButton.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
            
        }else{
            print("Unable to select an image")
        }
    }
}

