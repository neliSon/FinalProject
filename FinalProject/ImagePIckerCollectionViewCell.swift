//
//  ImagePIckerCollectionViewCell.swift
//  Mito
//
//  Created by Nelson Chow on 2016-04-27.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import UIKit

class ImagePIckerCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    weak var viewController:UIViewController!
    let imagePicker = UIImagePickerController()
    
    // MARK: Actions
    @IBAction func imagePickerButton(sender: UIButton) {
        pickImageWithActionSheet()
    }
    
    
    // MARK: General Functions
    func camera() {
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        
        viewController.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func photoLibrary() {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        viewController.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func pickImageWithActionSheet()  {
        // show alert to pick image from camera or photo library
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        viewController.presentViewController(actionSheet, animated: true, completion: nil)
        
    }
}
