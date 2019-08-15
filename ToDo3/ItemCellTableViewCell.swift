//
//  ItemCell.swift
//  ToDo3
//
//  Created by Greg Alton on 8/14/19.
//  Copyright © 2019 Greg Alton. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    var isChecked = false
    @IBOutlet weak var checkBox: UIImageView!    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
