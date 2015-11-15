//
//  AddItemViewController.swift
//  test
//
//  Created by Chia Wei Zheng Terry on 13/11/15.
//  Copyright © 2015 Chia Wei Zheng Terry. All rights reserved.
//


//Delegate Method http://stackoverflow.com/questions/30596023/swift-pass-data-back-from-popover-to-view-controller
//http://stackoverflow.com/questions/30618172/how-to-send-data-back-by-popviewcontrolleranimated-for-swift

import UIKit
import Parse

//MARK:- Protocol
protocol addItemDelegate {
    func addObjectsToMasterRefresh()
}

class AddItemViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var delegate:addItemDelegate?
    var objectsAddItem = [AnyObject]()
    
    @IBOutlet weak var newItemTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var remarks: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK:- View Controller
    override func viewDidLoad() {
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyBoard")
        self.view.addGestureRecognizer(tap)
    }
    
    func dismissKeyBoard() {
        self.view.endEditing(true)
    }
    
    //MARK:- Image
    
    @IBAction func chooseImageFromPhotoLibrary(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func chooseFromCamera(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK:-  Save Button
    @IBAction func saveButton(sender: AnyObject) {
        
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = "dd/MM/yy"
        let dateString =  dateformatter.stringFromDate(datePicker.date)
    
        //Image
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.0)
        let imageFile = PFFile(data: imageData!)
        
        //Prase Test
        let testObject = PFObject(className: "TestObject")
        testObject["item"] = newItemTextField.text
        testObject["expirydate"] = dateString
        testObject["remarks"] = remarks.text
        testObject["imageFile"] = imageFile
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
        print("Object has been saved.")
        self.delegate?.addObjectsToMasterRefresh()           //Method to call delegate
    }
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.navigationController?.popViewControllerAnimated(true)
        })

    }
}
