////
////  PhotoViewController.swift
////  FinalProject
////
////  Created by Nelson Chow on 2016-04-26.
////  Copyright © 2016 Nelson Chow. All rights reserved.
////
//
//import UIKit
//
//enum SelectedPhoto {
//    case none
//    case left
//    case right
//}
//
//class PhotoViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
//    
//    // MARK: Properties
//    
//    var selectedPhoto: SelectedPhoto = .none
//    
//    @IBOutlet weak var leftImageView: UIImageView!
//    @IBOutlet weak var rightImageView: UIImageView!
//    
//    let imagePicker = UIImagePickerController()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        imagePicker.delegate = self
//        
//        let tapGestureLeft = UITapGestureRecognizer(target: self, action: #selector(PhotoViewController.leftImageTapped(_:)))
//        let tapGestureRight = UITapGestureRecognizer(target: self, action: #selector(PhotoViewController.rightImageTapped(_:)))
//        
//        leftImageView.addGestureRecognizer(tapGestureLeft)
//        rightImageView.addGestureRecognizer(tapGestureRight)
//    }
//
//    // MARK: Actions
//    func leftImageTapped(gesture: UIGestureRecognizer) {
//            selectedPhoto = .left
//            pickImageWithActionSheet()
//    }
//    
//    func rightImageTapped(gesture: UIGestureRecognizer) {
//            selectedPhoto = .right
//            pickImageWithActionSheet()
//    }
//    
//    // MARK: UIImagePickerControllerDelegate
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        if selectedPhoto == .left {
//            leftImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//            self.dismissViewControllerAnimated(true, completion: nil)
//            selectedPhoto = .none
//        } else if selectedPhoto == .right {
//            rightImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//            self.dismissViewControllerAnimated(true, completion: nil)
//            selectedPhoto = .none
//        }
//    }
//    
//    // MARK: General Functions
//    func camera() {
//        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
//        
//        self.presentViewController(imagePicker, animated: true, completion: nil)
//    }
//    
//    func photoLibrary() {
//        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//        
//        self.presentViewController(imagePicker, animated: true, completion: nil)
//
//    }
//    
//    func pickImageWithActionSheet() {
//        // show alert to pick image from camera or photo library
//        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
//        
//        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction!) -> Void in
//            self.camera()
//        }))
//        
//        actionSheet.addAction(UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction!) -> Void in
//            self.photoLibrary()
//        }))
//        
//        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
//        
//        self.presentViewController(actionSheet, animated: true, completion: nil)
//
//    }
//    
//}
