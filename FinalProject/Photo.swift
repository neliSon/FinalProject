//
//  Photo.swift
//  Mito
//
//  Created by Nelson Chow on 2016-04-27.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import Foundation
import RealmSwift

class Photo: Object {
    
    // MARK: Properties
    dynamic var progressPhotoData: NSData?
    dynamic var date: NSDate?
    
    convenience init(progressPhotoData: NSData, date: NSDate) {
        self.init()
        self.progressPhotoData = progressPhotoData
        self.date = date
    }
}
