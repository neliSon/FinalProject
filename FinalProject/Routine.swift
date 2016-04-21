//
//  Routine.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-20.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import Foundation
import RealmSwift

class Routine: Object {
    
    dynamic var name = ""
    let exercises = List<Exercise>()

}
