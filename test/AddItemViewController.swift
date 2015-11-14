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

//MARK:- Protocol
protocol addItemDelegate {
    func addObjectsToMaster(parameter:[AnyObject])
}

class AddItemViewController: UIViewController {
    
    var delegate:addItemDelegate?
    var objectsAddItem = [AnyObject]()
    
    @IBOutlet weak var newItemTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var remarks: UITextView!
    
    
    //MARK:- View Controller
    override func viewDidLoad() {

    }
    
    //MARK:-  Save Button
    @IBAction func saveButton(sender: AnyObject) {
        
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = "dd/MM/yy"
        let dateString =  dateformatter.stringFromDate(datePicker.date)
        
        let objectDic = ["item": "\(newItemTextField.text!)",
                        "expirydate" : "\(dateString)",
                        "remarks" : "\(remarks.text)",
                        ]
        
        objectsAddItem.append(objectDic)
        self.navigationController?.popViewControllerAnimated(true)
        delegate?.addObjectsToMaster(objectsAddItem)           //Method to call delegate
        
    }

}
