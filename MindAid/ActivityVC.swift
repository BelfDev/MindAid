//
//  ActivityVC.swift
//  MindAid
//
//  Created by Pedro Henrique Belfort Fernandes on 3/26/15.
//  Copyright (c) 2015 Pedro Belfort. All rights reserved.
//

import UIKit

// Belfort

class ActivityVC: UIViewController, UITextFieldDelegate, ImagePickerVCDelegate {

    //Declarations
    
    @IBOutlet weak var imageIcon: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var chosenImage:String?
    var dayTime:String!
    
    //Setting up ActivityViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Make the keyboard disappear when press return
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }

    //Done button
    @IBAction func done(sender: AnyObject) {
        
        if (titleTextField.text != "" && chosenImage != nil){
            
            var newActivity = Activity(title: titleTextField.text, imageName: chosenImage!)
            
            if descriptionTextField.text != ""
            {
                newActivity.description = descriptionTextField.text
            }
            
            println(newActivity.title)
            println(newActivity.imageName)
            println(newActivity.description)
            println(dayTime)
            
            DAO.saveActivity(newActivity,dayTime: dayTime)
            
            navigationController?.popToRootViewControllerAnimated(true)
            
        }
        else{
            
            let alertController = UIAlertController(title: "UH-OH", message:
                "Don`t forget to choose title and image", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func cancel(sender: AnyObject) {
        
        navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    func didPickImage(controller: ImagePickerVC, imageName: String) {
        
        //Setting up button Image
        
        chosenImage = imageName
        let buttonImage = UIImage (named: chosenImage!)
        
        imageIcon.setImage(buttonImage, forState: .Normal)
        controller.navigationController?.popViewControllerAnimated(true)
        
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "pickImageButton"{
            let vc = segue.destinationViewController as ImagePickerVC
            vc.delegate = self
            
        }
    }

}
