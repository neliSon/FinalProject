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
    
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var exerciseStackView: UIStackView!

    func configureButtons(exercise: Exercise) {
        for view in self.exerciseStackView.subviews {
            view.removeFromSuperview()
        }
        
        for i in 0...5 {
            if let customView = NSBundle.mainBundle().loadNibNamed("SetButton", owner: self, options: nil).first as? SetButton {
            
            
            
//            button.setTitle("\(i)", forState: UIControlState.Normal)
            
            self.exerciseStackView.addArrangedSubview(customView)
            }
        }
    }
    
    func displayExercise(exercise: Exercise) {
        exerciseNameLabel.text = exercise.name
    }
}
