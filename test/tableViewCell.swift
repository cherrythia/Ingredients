//
//  tableViewCell.swift
//  test
//
//  Created by Chia Wei Zheng Terry on 16/11/15.
//  Copyright © 2015 Chia Wei Zheng Terry. All rights reserved.
//

import UIKit

class tableViewCell: UITableViewCell {

    @IBOutlet weak var labelCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //config the view for the selected state
    }
}
