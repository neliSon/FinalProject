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
  
    var routine: Routine! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = routine.name
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routine.exercises.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ExerciseCell", forIndexPath: indexPath) as! ExerciseTableViewCell
        
        let exercise = routine.exercises[indexPath.row]
        
        cell.exercise = exercise

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
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

    // MARK: TableView Delegate
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    // MARK: Actions
    @IBAction func addCustomExerciseButton(sender: UIBarButtonItem) {
        // segue into AddCustomExerciseVC
        self.performSegueWithIdentifier("addExerciseSegue", sender: self)
    }
    
    
    // MARK: General Functions
    
}
