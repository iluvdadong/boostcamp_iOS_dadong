//
//  ViewController.swift
//  FoodTracker
//
//  Created by dadong on 2017. 7. 5..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
         mealNameLabel.text = textField.text
    }
    
    //MARK: Actions
    @IBAction func setDefualtLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
}

