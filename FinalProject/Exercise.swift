//
//  Exercise.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-19.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import Foundation
import RealmSwift


enum ExerciseType: String {
    case Squats = "Squats"
    case None = ""
}

class Exercise: Object {
    
    // MARK: Properties
    
    dynamic var name = ""               // name of exercise
    dynamic var oneRepMax = 0.0         // maximum amount of weight user can lift
    
    
   convenience init?(name: String, oneRepMax: Double) {
        self.init()
        self.name = name
        self.oneRepMax = oneRepMax
    }
    
    var type: ExerciseType {
        get {
            return ExerciseType(rawValue: self.name) ?? ExerciseType.Squats
        }
        
        set {
            self.name = newValue.rawValue
        }
    }

// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
    
    func weightsForSet() -> [Double] {
    
        let percentages = [0.5, 0.6, 0.6, 0.8, 0.8, 0.9]
        
        let weights = percentages.map {
            percentage in
            return self.oneRepMax * percentage
        }
        
        return weights
    }
}


