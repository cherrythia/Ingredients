//
//  DetailViewController.swift
//  test
//
//  Created by Chia Wei Zheng Terry on 13/11/15.
//  Copyright © 2015 Chia Wei Zheng Terry. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var remarksLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                let item = detail["item"]
                label.text = item?!.description
                let expirydate = detail["expirydate"]
                dateLabel.text = expirydate?!.description
                let remarks = detail["remarks"]
                remarksLabel.text = remarks?!.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

