//
//  GraphTableViewCell.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-25.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import UIKit
import BEMSimpleLineGraph

class GraphTableViewCell: UITableViewCell, BEMSimpleLineGraphDelegate, BEMSimpleLineGraphDataSource {

    // MARK: Properties
    var exercise: Exercise! {
        didSet {
            graphLabel.text = exercise.name
        }
    }
    
    @IBOutlet weak var graphLabel: UILabel!
    @IBOutlet weak var graphView: BEMSimpleLineGraphView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    // MARK: BEMSimpleLineGraphDataSource
    func numberOfPointsInLineGraph(graph: BEMSimpleLineGraphView) -> Int {
        print(exercise.oneRepMaxes)
        
        return exercise.oneRepMaxes.count
    }
    
    func lineGraph(graph: BEMSimpleLineGraphView, valueForPointAtIndex index: Int) -> CGFloat {
        return CGFloat(exercise.oneRepMaxes[index].weight)
    }
    
    // MARK: General Functions
    func reloadUI() {
        graphView.reloadGraph()
    }
}
