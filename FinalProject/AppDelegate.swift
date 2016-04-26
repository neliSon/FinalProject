//
//  AppDelegate.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-19.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        print(try! Realm().path)
        
        loadRoutineTemplate()
        return true
    }

    // MARK: General Functions
    
    func loadRoutineTemplate() {
        
        let realm = try! Realm()
        if realm.objects(Exercise).count == 0 {
            
            // lower body
            let squats = Exercise()
            squats.name = "Squats"
            squats.oneRepMax = 200.0
            
            let lunges = Exercise()
            lunges.name = "Lunges"
            lunges.oneRepMax = 70.0
            
            let legCurls = Exercise()
            legCurls.name = "Leg Curls"
            legCurls.oneRepMax = 50.0
            
            let calves = Exercise()
            calves.name = "Calves"
            calves.oneRepMax = 100.0
            
            let lowerBodyRoutine = Routine()
            lowerBodyRoutine.name = "LOWER BODY"
            lowerBodyRoutine.exercises.append(squats)
            lowerBodyRoutine.exercises.append(lunges)
            lowerBodyRoutine.exercises.append(legCurls)
            lowerBodyRoutine.exercises.append(calves)
            
            // back
            let pullUps = Exercise()
            pullUps.name = "Weighted Pull-ups"
            pullUps.oneRepMax = 200.0
            
            let bentOverRows = Exercise()
            bentOverRows.name = "Bent Over Rows"
            bentOverRows.oneRepMax = 100.0
            
            let bicepCurls = Exercise()
            bicepCurls.name = "Bicept Curls"
            bicepCurls.oneRepMax = 30.0
            
            let backRoutine = Routine()
            backRoutine.name = "BACK"
            backRoutine.exercises.append(pullUps)
            backRoutine.exercises.append(bentOverRows)
            backRoutine.exercises.append(bicepCurls)
            
            // chest, shoulders
            let benchPress = Exercise()
            benchPress.name = "Bench Press"
            benchPress.oneRepMax = 140.0
            
            let militaryPress = Exercise()
            militaryPress.name = "Military Press"
            militaryPress.oneRepMax = 100.0
            
            let weightedDips = Exercise()
            weightedDips.name = "Weighted Dips"
            weightedDips.oneRepMax = 170.0
            
            let wristCurls = Exercise()
            wristCurls.name = "Wrist Curls"
            wristCurls.oneRepMax = 40.0
            
            let chestAndShouldersRoutine = Routine()
            chestAndShouldersRoutine.name = "CHEST & SHOULDERS"
            chestAndShouldersRoutine.exercises.append(benchPress)
            chestAndShouldersRoutine.exercises.append(militaryPress)
            chestAndShouldersRoutine.exercises.append(weightedDips)
            chestAndShouldersRoutine.exercises.append(wristCurls)
            
            // save data
            
            try! realm.write {
                // lower body
                realm.add(squats)
                realm.add(lunges)
                realm.add(legCurls)
                realm.add(calves)
                
                realm.add(lowerBodyRoutine)
                
                // back
                realm.add(pullUps)
                realm.add(bentOverRows)
                realm.add(bicepCurls)
                
                realm.add(backRoutine)
                
                // chest, shoulders
                realm.add(benchPress)
                realm.add(militaryPress)
                realm.add(weightedDips)
                realm.add(wristCurls)
                
                realm.add(chestAndShouldersRoutine)
            }
        }
    }
}

