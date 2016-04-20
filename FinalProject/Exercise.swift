//
//  Exercise.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-19.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import Foundation
import RealmSwift

class Exercise: Object {
    
    dynamic var name = ""       // name of exercise
    dynamic var weight = 0.0    // weight lifted in lbs
    dynamic var rep = 0         // reps
    dynamic var set = 0         // sets
    dynamic var oneRepMax = 0   // maximum amount of weight user can lift
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
