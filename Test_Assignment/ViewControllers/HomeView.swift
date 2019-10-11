//
//  HomeView.swift
//  Test_Assignment
//
//  Created by Aress Software Pvt Ltd on 19/09/19.
//  Copyright © 2019 Aress Software Pvt Ltd. All rights reserved.
//

import UIKit

class HomeView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   @IBAction func onClickLogout(_ sender: UIButton) {
        self.performSegue(withIdentifier: "seguetoLogout", sender: nil)
        
    }
}
