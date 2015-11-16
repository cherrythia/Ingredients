//
//  RegisterUserViewController.swift
//  test
//
//  Created by Chia Wei Zheng Terry on 17/11/15.
//  Copyright © 2015 Chia Wei Zheng Terry. All rights reserved.
//

import UIKit
import Parse

class RegisterUserViewController: UIViewController {
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
    let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyBoard")
    self.view.addGestureRecognizer(tap)
    }
    
    func dismissKeyBoard() {
        self.view.endEditing(true)
    }
    
    @IBAction func signUp(sender: AnyObject) {
        
        let user = PFUser()
        user.username = self.userTextField.text
        user.password = self.passwordTextField.text
//        user.email = "nil"
        
        user.signUpInBackgroundWithBlock({
            (succeeded: Bool, error: NSError?) -> Void in
            
            if error == nil {
                //There was no error.
                
                print("Successfully Signed Up User.")
                
                let vc: UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("masternavigationcontroller"))!
                self.presentViewController(vc, animated: true, completion: nil)
                
            } else {
                //There were one ore more errors while signing up the user.
                
                let alertController = UIAlertController(title: "Error", message: "There was one or more errors while signing up.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
            
        })
    }
    @IBAction func cancelTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
