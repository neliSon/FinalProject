//
//  SelectRoutineTableViewController.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-21.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import UIKit
import RealmSwift

class SelectRoutineTableViewController: UITableViewController {

    // MARK: Properties
    var routines = (try! Realm()).objects(Routine)
//    var routineType: RoutineType!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routines.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RoutineCell", forIndexPath: indexPath) as! SelectRoutineTableViewCell

        let routine = routines[indexPath.row]
        
        cell.routineLabel.text = routine.name

        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showExerciseSegue" {

            
            var indexPath: NSIndexPath? = tableView.indexPathForSelectedRow
            
            if let sender = sender as? UITableViewCell {
                indexPath = tableView.indexPathForCell(sender)
            }
            
            if let routineSelected = indexPath?.row {
                
                if let destinationVC: RoutineTableViewController = segue.destinationViewController as? RoutineTableViewController {
                    let routine = routines[routineSelected]
                    destinationVC.routine = routine
                }
            }
        }
    }
}
