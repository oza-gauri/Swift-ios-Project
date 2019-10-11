//
//  BloodPressure.swift
//  Test_Assignment
//
//  Created by Aress Software Pvt Ltd on 20/09/19.
//  Copyright © 2019 Aress Software Pvt Ltd. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import  CoreData

class BloodPressure: UIViewController, UITableViewDataSource, UITableViewDelegate {
   //Below is object for the root class
    var bp = [BloodReport]()
    var obj : BloodReportRoot?
    
    @IBOutlet weak var tblBloodReport: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

            if (NetworkReachabilityManager()?.isReachable)! {
                fetchDataForBlood()
                 bp = CoreDataManager.shareInstance.getbpData()
            }
            else {
                bp = CoreDataManager.shareInstance.getbpData()
            }
        
        print( bp.count)
        // Do any additional setup after loading the view.
    }

    //function for fetching data for blood pressure
    func fetchDataForBlood() {
        let strurl = "https://next.json-generator.com/api/json/get/4y0rTc68v"
        APIManager.sharedInstanceAPI.requestGetURL(strURL: strurl, success: { (value) in
            print("Success with JSON: \(value)")
            let   json = JSON(value)
            self.obj = BloodReportRoot.init(fromJson: json)
            for item in (self.obj?.bloodpressure.data)! {
                let infosyst = item.systolic
                let infodiast = item.diastolic
                let infopulse = item.pulse
                self.insertintoBloodReport(systolic: infosyst!, diastolic: infodiast!, pulse: infopulse!)
                print(infosyst as Any)
                print(infodiast as Any)
                print(infopulse as Any)
                self.tblBloodReport.reloadData()
            }
        }) { (failure) in
        }
    }
    //Function to insert json response into coredata
    func insertintoBloodReport(systolic: Int, diastolic: Int, pulse: Int) -> BloodReport? {
        let managedContext = CoreDataManager.shareInstance.context
        let entity = NSEntityDescription.entity(forEntityName: "BloodReport", in: managedContext! )
        let newbloodReport = NSManagedObject(entity: entity!, insertInto: managedContext) as! BloodReport
        newbloodReport.systolic = Int64(systolic)
        newbloodReport.diastolic = Int64(diastolic)
        newbloodReport.pulse = Int64(pulse)
        do {
            try managedContext!.save()
            return newbloodReport
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return nil
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return obj?.bloodpressure.data.count ?? 0
        return bp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bpcell = tblBloodReport.dequeueReusableCell(withIdentifier: "cellbp", for: indexPath) as! BloodPressureTableViewCell
            let item = bp[indexPath.row]
            bpcell.lblsys.text = "\(item.systolic)"
            bpcell.lbldisys.text = "\(item.diastolic)"
            bpcell.lblpulse.text = "\(item.pulse)"
            return bpcell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
   
}
