//
//  RoutineTableViewController.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-20.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import UIKit
import RealmSwift
import SnappingStepper

class RoutineTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var exercises = (try! Realm()).objects(Exercise)//.filter(<#T##predicate: NSPredicate##NSPredicate#>)

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // load data
        loadRoutineTemplate()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return exercises.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ExerciseCell", forIndexPath: indexPath) as! ExerciseTableViewCell
        
        
        
        let exercise = exercises[indexPath.row]
        
        cell.oneRepMaxLabel.text = "\(exercise.oneRepMax)"
        cell.displayExercise(exercise)
        cell.configureButtons(exercise)

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // MARK: General Functions
    
    func loadRoutineTemplate() {
        
        // lower body
        
        let realm = try! Realm()
        if realm.objects(Exercise).count == 0 {
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
            
            // back
            let pullUps = Exercise()
            pullUps.name = "Pull-ups"
            pullUps.oneRepMax = 200.0
            
            let bentOverRows = Exercise()
            bentOverRows.name = "Bent Over Rows"
            bentOverRows.oneRepMax = 100.0
            
            let bicepCurls = Exercise()
            bicepCurls.name = "Bicept Curls"
            bicepCurls.oneRepMax = 30.0
            
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
            
            // save data
            
            try! realm.write {
                // lower body
                realm.add(squats)
                realm.add(lunges)
                realm.add(legCurls)
                realm.add(calves)
                
                // back
                realm.add(pullUps)
                realm.add(bentOverRows)
                realm.add(bicepCurls)
                
                // chest, shoulders
                realm.add(benchPress)
                realm.add(militaryPress)
                realm.add(weightedDips)
                realm.add(wristCurls)
            }
        }
//        print(realm.objects(Exercise).count)
    }
}
