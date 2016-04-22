//
//  AddExerciseTableViewController.swift
//  FinalProject
//
//  Created by Nelson Chow on 2016-04-22.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

import UIKit

class AddExerciseTableViewController: UITableViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var exerciseNameTextField: UITextField!
    @IBOutlet weak var oneRepMaxTextField: UITextField!
    @IBOutlet weak var saveExerciseButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exerciseNameTextField.delegate = self
        oneRepMaxTextField.delegate = self
        
        checkValidFields()  // Enable save button only if all fields are not empty.
    }
    
    // MARK: Actions
    @IBAction func saveExerciseButton(sender: UIBarButtonItem) {
        print("Works")
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // Hide keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveExerciseButton.enabled = false
    }
    
    func checkValidFields() {
        // Disable the Save button if the text fields are empty.
        let nameText = exerciseNameTextField.text ?? ""
        let ormText = oneRepMaxTextField.text ?? ""
        
        let nameFieldHasText = nameText != ""
        let ormFieldHasText = ormText != ""
        
        saveExerciseButton.enabled = nameFieldHasText && ormFieldHasText
    }
    
    func textFieldDidEndEditing(textField: UITextField) -> Bool {
        checkValidFields()
    }
}
