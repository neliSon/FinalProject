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
    var exercise: Exercise! = nil {
        didSet {
            updateUI()
        }
    }
    
    var crossImageViews = [UIImageView]()
    
    // Set Buttons
    @IBOutlet weak var firstSetButton: UIButton!
    @IBOutlet weak var secondSetButton: UIButton!
    @IBOutlet weak var thirdSetButton: UIButton!
    @IBOutlet weak var fourthSetButton: UIButton!
    @IBOutlet weak var fifthSetButton: UIButton!
    @IBOutlet weak var sixthSetButton: UIButton!
    
    // Button Weight Labels
    @IBOutlet weak var firstWeightLabel: UILabel!
    @IBOutlet weak var secondWeightLabel: UILabel!
    @IBOutlet weak var thirdWeightLabel: UILabel!
    @IBOutlet weak var fourthWeightLabel: UILabel!
    @IBOutlet weak var fifthWeightLabel: UILabel!
    @IBOutlet weak var sixthWeightLabel: UILabel!
    
    // One Rep Max Labels
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var oneRepMaxLabel: UILabel!

    
    // MARK: Actions
    // Set Buttons
    @IBAction func firstButtonPressed(sender: UIButton) {
        print("first")
        secondSetButton.enabled = true
        firstSetButton.enabled = false
        crossElement(sender)
    }
    
    @IBAction func secondButtonPressed(sender: UIButton) {
        print("second")
        thirdSetButton.enabled = true
        secondSetButton.enabled = false
        crossElement(sender)
    }
    
    @IBAction func thirdButtonPressed(sender: UIButton) {
        print("third")
        fourthSetButton.enabled = true
        thirdSetButton.enabled = false
        crossElement(sender)
    }
    
    @IBAction func fourthButtonPressed(sender: UIButton) {
        print("fourth")
        fifthSetButton.enabled = true
        fourthSetButton.enabled = false
        crossElement(sender)
    }
    
    @IBAction func fifthButtonPressed(sender: UIButton) {
        print("fifth")
        sixthSetButton.enabled = true
        fifthSetButton.enabled = false
        crossElement(sender)
    }
    
    @IBAction func sixthButtonPressed(sender: UIButton) {
        print("sixth")
        sixthSetButton.enabled = false
        crossElement(sender)
        // add one rep max to array
        let weight = exercise.oneRepMax
        let everyMaxRep = EveryMaxRep()
        let realm = try! Realm()
        try! realm.write {
            everyMaxRep.weight = weight
            exercise.oneRepMaxes.append(everyMaxRep)
        }
        print(exercise.oneRepMaxes)
    }
    
    // One Rep Max Buttons
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
        let weights = exercise.weightsForSet()
        
        // maybe refactor this
        firstWeightLabel.text = String(format: "%0.f lbs", roundToFives(weights[0]))
        secondWeightLabel.text = String(format: "%0.f lbs", roundToFives(weights[1]))
        thirdWeightLabel.text = String(format: "%0.f lbs", roundToFives(weights[2]))
        fourthWeightLabel.text = String(format: "%0.f lbs", roundToFives(weights[3]))
        fifthWeightLabel.text = String(format: "%0.f lbs", roundToFives(weights[4]))
        sixthWeightLabel.text = String(format: "%0.f lbs", roundToFives(weights[5]))
        
    }
    
    func exerciseName() {
        exerciseNameLabel.text = exercise.name
    }
    
    func updateUI() {
        oneRepMaxLabel.text = String(format: "%0.f lbs", exercise.oneRepMax)
        exerciseName()
        configureButtons()
    }
    
    func crossElement(sender: UIButton, animated: Bool = true) {
        let crossImageView = UIImageView(image: UIImage(named: "cross"))
        crossImageView.frame = CGRectMake(0, 0, sender.frame.width*5, sender.frame.height*5)
        crossImageView.center = sender.center
        sender.superview?.addSubview(crossImageView)
        crossImageViews.append(crossImageView)
        if animated {
            UIView.animateWithDuration(0.8) {
                crossImageView.frame = CGRectMake(0, 0, sender.frame.width, sender.frame.height)
                crossImageView.center = sender.center
            }
        } else {
            crossImageView.frame = CGRectMake(0, 0, sender.frame.width, sender.frame.height)
            crossImageView.center = sender.center
        }
    }
}
