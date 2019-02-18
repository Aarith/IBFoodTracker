//
//  ViewController.swift
//  FoodTracker
//
//  Created by Ian Campbell Brothers on 2/15/19.
//  Copyright © 2019 Ian Campbell Brothers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    @IBOutlet weak var MealName: UITextField!
    @IBOutlet weak var MealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        MealName.delegate = self
    }


    // MARK: UITextFieldDelegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // Hide the Keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField){
        MealNameLabel.text = textField.text
    }
    
    
        // MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        MealNameLabel.text = "Default Text"
    }
    
}

