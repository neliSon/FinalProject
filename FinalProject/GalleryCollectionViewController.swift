//
//  GalleryCollectionViewController.swift
//  Mito
//
//  Created by Nelson Chow on 2016-04-27.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import UIKit
import RealmSwift

class GalleryCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photos = (try! Realm()).objects(Photo)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 1
        } else {
            return photos.count
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photoCell", forIndexPath: indexPath) as! GalleryCollectionViewCell
            
            let photo = photos[indexPath.row]
            let data = photo.progressPhotoData
            let image = UIImage(data: data!)
            cell.photoImageView.image = image
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("imagePickerCell", forIndexPath: indexPath) as! ImagePIckerCollectionViewCell
            
            cell.imagePicker.delegate = self
            cell.viewController = self
            cell.imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            
            return cell
        }
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            let unformattedData = UIImageJPEGRepresentation(image, 1.0)
            let date = NSDate()
            if let data = unformattedData {
                let photo = Photo(progressPhotoData: data, date: date)
                let realm = try! Realm()
                try! realm.write {
                    realm.add(photo)
                }
            }
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    // MARK: General Functions
    func configureLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: collectionView!.frame.width, height: collectionView!.frame.height)
        flowLayout.sectionInset = UIEdgeInsetsMake(64, 0, 0, 0)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .Horizontal
        
        self.collectionView!.pagingEnabled = true
        self.collectionView!.collectionViewLayout = flowLayout;
        self.collectionView!.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.collectionView!.contentOffset = CGPointZero
    }

}
