//
//  GrowingTableViewCell.swift
//  SwipeDeleteBug
//
//  Created by Jason Ji on 6/8/17.
//  Copyright © 2017 Jason Ji. All rights reserved.
//

import UIKit

class GrowingTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
