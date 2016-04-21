//
//  ExerciseTableViewCell.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-20.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import UIKit
import RealmSwift

class ExerciseTableViewCell: UITableViewCell {

    // MARK: Properties
    let setsOfReps = [20, 8, 6, 5, 5, 2]                    // amount of reps per set
    var exercise: Exercise! = nil {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var exerciseStackView: UIStackView!
    @IBOutlet weak var oneRepMaxLabel: UILabel!

    // MARK: Actions
    @IBAction func addWeightButton(sender: UIButton) {
        try! Realm().write {
            exercise.oneRepMax += 5         // add weight on the exercise's ORM by 5 pounds
        }
        self.updateUI()
    }
    
    @IBAction func subtractWeightButton(sender: UIButton) {
        try! Realm().write {
            if exercise.oneRepMax != 0 {
                exercise.oneRepMax -= 5         // minus weight on the exercise's ORM by 5 pounds
            }
        }
        self.updateUI()
    }
    
    // MARK: General Functions
    
    func configureButtons() {
        
        for view in self.exerciseStackView.subviews {
            view.removeFromSuperview()
        }
        
        let weights = exercise.weightsForSet()
        
        for i in 0..<setsOfReps.count {
            let eachSet = setsOfReps[i]
            let weight = weights[i]
            
            if let customView = NSBundle.mainBundle().loadNibNamed("SetButton", owner: self, options: nil).first as? SetButton {
                
                customView.setButton.setTitle("\(eachSet)", forState: [])
                customView.weightLabel.text = String(format: "%0.0f lbs", weight)
                
                self.exerciseStackView.addArrangedSubview(customView)
            }
        }
    }
    
    func exerciseName() {
        exerciseNameLabel.text = exercise.name
    }
    
    func updateUI() {
        oneRepMaxLabel.text = "\(exercise.oneRepMax) lbs"
        exerciseName()
        configureButtons()
    }
}
