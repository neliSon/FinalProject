//
//  GraphsTableViewController.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-23.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import UIKit
import RealmSwift
//import BEMSimpleLineGraph

class GraphsTableViewController: UITableViewController {

    // MARK: Properties
    var routines = (try! Realm()).objects(Routine)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        routines = (try! Realm()).objects(Routine)
        tableView.reloadData()
    }
    // MARK: TableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let routine = routines[section]
        
        return routine.exercises.count
        // return count of exercises in each routine
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return routines.count
        // return count of routines
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("graphCell", forIndexPath: indexPath) as! GraphTableViewCell
        
        let routine = routines[indexPath.section]
        let exercise = routine.exercises[indexPath.row]
        
        cell.exercise = exercise
        
        return cell
    }
    
    // MARK: TableViewDelegate
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
}
