//
//  AddExerciseTableViewController.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-22.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import UIKit
import RealmSwift

class AddExerciseTableViewController: UITableViewController, UITextFieldDelegate {

    // MARK: Properties
    var routine: Routine! = nil
    
    @IBOutlet weak var exerciseNameTextField: UITextField!
    @IBOutlet weak var oneRepMaxTextField: UITextField!
    @IBOutlet weak var saveExerciseButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exerciseNameTextField.delegate = self
        oneRepMaxTextField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddExerciseTableViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        checkValidFields()  // Enable save button only if all fields are not empty.
    }
    
    // MARK: Actions
    
    @IBAction func saveExerciseButton(sender: UIBarButtonItem) {
        // create exercise with name and weight
        let name = exerciseNameTextField.text!
        let ormWeight = Double(oneRepMaxTextField.text!) ?? 0.0
        
        let exercise = Exercise(name: name, oneRepMax: roundToFives(ormWeight))
        let realm = try! Realm()
        try! realm.write {
            routine.exercises.append(exercise!)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidFields()
    }
    
    // MARK: UITableViewDelegate
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    // MARK: General Functions
    
    func checkValidFields() {
        // Disable the Save button if the text fields are empty.
        let nameText = exerciseNameTextField.text ?? ""
        let ormText = oneRepMaxTextField.text ?? ""
        
        let nameFieldHasText = nameText != ""
        let ormFieldHasText = ormText != ""
        
        saveExerciseButton.enabled = nameFieldHasText && ormFieldHasText
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
