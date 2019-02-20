//
//  ViewController.swift
//  FoodTracker
//
//  Created by Ian Campbell Brothers on 2/15/19.
//  Copyright © 2019 Ian Campbell Brothers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    
    @IBOutlet weak var MealName: UITextField!
    @IBOutlet weak var MealNameLabel: UILabel!
    @IBOutlet weak var PhotoImageView: UIImageView!
    
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
    
    
        // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user cancelled
        dismiss(animated: true, completion: nil)
    }
    
    func ImagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        
        // Set photoImageView to display the selected image
            PhotoImageView.image = selectedImage
            
        // Dismiss the picker
            dismiss(animated: true, completion: nil)
        
        }
    }
    

    
        // MARK: Actions
    @IBAction func SelectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide the Keyboard
        nameTextField.resignFirstResponder()
        
        // UIImageController is a view controller that lets a user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        // Only allows photos to be picked, not taken
       // UIImagePickerController.SourceType.photoLibrary
        imagePickerController.sourceType = .photoLibrary
       
        // Make sure ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        MealNameLabel.text = "Default Text"
    }
    
}

