//
//  GraphsTableViewController.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-23.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import UIKit
import RealmSwift

class GraphsTableViewController: UITableViewController {

    // MARK: Properties
//    var routines = (try! Realm()).objects(Routine)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("graphCell", forIndexPath: indexPath)

        

        return cell
    }
}
