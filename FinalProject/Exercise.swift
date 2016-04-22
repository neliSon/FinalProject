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
    
    // MARK: Properties
    
    dynamic var name = ""               // name of exercise
    dynamic var oneRepMax = 0.0         // maximum amount of weight user can lift
    
    convenience init?(name: String, oneRepMax: Double) {
        self.init()
        self.name = name
        self.oneRepMax = oneRepMax
    }

    func weightsForSet() -> [Double] {
    
        let percentages = [0.5, 0.6, 0.8, 0.8, 0.9, 0.95]
        
        let weights = percentages.map {
            percentage in
            return self.oneRepMax * percentage
        }
        
        return weights
    }
}
//
//enum RoutineType: Int {
//    case LowerBody
//    case Back
//    case ChestAndShoulders
//    case All
//}
