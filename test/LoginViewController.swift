//
//  LoginViewController.swift
//  test
//
//  Created by Chia Wei Zheng Terry on 16/11/15.
//  Copyright © 2015 Chia Wei Zheng Terry. All rights reserved.
//

import UIKit
import Parse

class LoginViewController:  UIViewController ,UISplitViewControllerDelegate{
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func login(sender: AnyObject) {
        let userName : String = self.usernameTextField.text!
        let password : String = self.passwordTextField.text!
        
        PFUser .logInWithUsernameInBackground(userName, password: password) { (
            user: PFUser?, error: NSError?) -> Void in
            if (user != nil){
                //log in succesfully
                print("successed")
                
                let svc: AnyObject? = self.storyboard?.instantiateViewControllerWithIdentifier("masternavigationcontroller")
                self.presentViewController(svc as! UIViewController, animated: true, completion: nil)
                
            } else {
                //log in failed
                let alertController = UIAlertController(title: "Error", message: "Incorrect password/ Username", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
}
