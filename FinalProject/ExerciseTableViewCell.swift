//
//  ExerciseTableViewCell.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-20.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import UIKit
import KCFloatingActionButton

class ExerciseTableViewCell: UITableViewCell {

    // MARK: Properties
    let setsOfReps = [20, 8, 6, 5, 5, 2]              // amount of reps per set
    let weightOfReps = [0.5, 0.6, 0.6, 0.8, 0.8, 0.9] // percentage of ORM per set
    
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var exerciseStackView: UIStackView!
    @IBOutlet weak var oneRepMaxLabel: UILabel!

    // MARK: Actions
    @IBAction func addWeightButton(sender: UIButton) {
        // add weight on the exercise's ORM by 5 pounds
        // update ui
    }
    
    @IBAction func subtractWeightButton(sender: UIButton) {
        // minus weight on the exercise's ORM by 5 pounds
        // update ui
    }
    
    
    // MARK: General Functions
    
    func configureButtons(exercise: Exercise) {
        for view in self.exerciseStackView.subviews {
            view.removeFromSuperview()
        }
        
        for eachSet in setsOfReps {
            if let customView = NSBundle.mainBundle().loadNibNamed("SetButton", owner: self, options: nil).first as? SetButton {

            customView.setButton.setTitle("\(eachSet)", forState: [])
                //  set weight based on a percentage of ORM
                //  customView.weightLabel.text = exercise.oneRepMax
                
            self.exerciseStackView.addArrangedSubview(customView)
            }
        }
        
        
    }
    
    func displayExercise(exercise: Exercise) {
        exerciseNameLabel.text = exercise.name
    }
}
