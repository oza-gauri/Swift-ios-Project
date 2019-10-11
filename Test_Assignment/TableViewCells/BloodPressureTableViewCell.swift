//
//  BloodPressureTableViewCell.swift
//  Test_Assignment
//
//  Created by Aress Software Pvt Ltd on 20/09/19.
//  Copyright © 2019 Aress Software Pvt Ltd. All rights reserved.
//

import UIKit

class BloodPressureTableViewCell: UITableViewCell {
    //MARK:- Variables Declaration
    @IBOutlet weak var lblpulse: UILabel!
    @IBOutlet weak var lbldisys: UILabel!
    @IBOutlet weak var lblsys: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
