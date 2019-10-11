//
//  MedicineCell.swift
//  Test_Assignment
//
//  Created by Aress Software Pvt Ltd on 20/09/19.
//  Copyright © 2019 Aress Software Pvt Ltd. All rights reserved.
//

import UIKit

class MedicineCell: UITableViewCell {
    //MARK:- Variables Declaration
    @IBOutlet weak var lbldsgno: UILabel!
    @IBOutlet weak var lblFreq: UILabel!
    @IBOutlet weak var lblfromto: UILabel!
    @IBOutlet weak var lblmg: UILabel!
    @IBOutlet weak var lblNotes: UILabel!
    @IBOutlet weak var lblDosage: UILabel!
    @IBOutlet weak var lblPrescribe: UILabel!
    @IBOutlet weak var viewForCell: UIView!
    @IBOutlet weak var lblMedName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    
    }

}

