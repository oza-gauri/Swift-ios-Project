//
//  MedicineList.swift
//  Test_Assignment
//
//  Created by Aress Software Pvt Ltd on 20/09/19.
//  Copyright © 2019 Aress Software Pvt Ltd. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreData

class MedicineList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK:- Variables Declaration
    var medobj: MedicineReportRoot?
    var medoff = [Medicines]()
    @IBOutlet weak var tblMedicines: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if (NetworkReachabilityManager()?.isReachable)! {
            fetchMedicineData()
            medoff = CoreDataManager.shareInstance.getmedicinedata()
        }
        else {
            medoff = CoreDataManager.shareInstance.getmedicinedata()
        }
       print(medoff.count)
    }
//Function to fetch data for medicines
    func fetchMedicineData() {
        let medurl = "https://next.json-generator.com/api/json/get/EksY25aUv"
        APIManager.sharedInstanceAPI.requestGetURL(strURL: medurl, success: { (valuemed) in
            print("Success with JSON: \(valuemed)")
            let   json = JSON(valuemed)
            self.medobj = MedicineReportRoot.init(fromJson: json)
            for item in (self.medobj?.medicines.data)! {
                let medname = item.medicineName
                let fromdate = item.fromDate
                let dosg = item.dosage
                let freq = item.frequency
                let prescby = item.prescribeBy
                let notes = item.note
                
                print(medname as Any)
                print(fromdate as Any)
                print(dosg as Any)
                print(freq as Any)
                print(prescby as Any)
                print(notes as Any)
                
                self.insertintoMedicineReport(medicinename: medname!, prescribedby: Int64(prescby!), dosage: dosg!, note: notes!, fromdate: fromdate!, frequency: Int64(freq!))
                
                self.tblMedicines.reloadData()
            }
        }) { (failure) in
            
        }
    }
    //Function to insert json response into core data
    func insertintoMedicineReport(medicinename: String, prescribedby: Int64, dosage: String, note: String, fromdate: String, frequency: Int64) -> Medicines? {
        let managedContext = CoreDataManager.shareInstance.context
        let entity = NSEntityDescription.entity(forEntityName: "Medicines", in: managedContext! )
        let newMedicinesReport = NSManagedObject(entity: entity!, insertInto: managedContext) as! Medicines
        newMedicinesReport.medicinename = String(medicinename)
        newMedicinesReport.prescribedby = Int64(prescribedby)
        newMedicinesReport.dosage = String(dosage)
        newMedicinesReport.frequency = Int64(frequency)
        newMedicinesReport.fromdate = String(fromdate)
        newMedicinesReport.note = String(note)

        do {
            try managedContext!.save()
            return newMedicinesReport
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medoff.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblMedicines.dequeueReusableCell(withIdentifier: "cellmedicine", for: indexPath) as! MedicineCell
        
        
        cell.viewForCell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.viewForCell.layer.shadowColor = UIColor.black.cgColor
        cell.viewForCell.layer.shadowRadius = 5
        cell.viewForCell.layer.shadowOpacity = 0.40
        cell.viewForCell.layer.masksToBounds = false
        cell.viewForCell.clipsToBounds = false
        
        let item = medoff[indexPath.row]
            cell.lblMedName.text = item.medicinename
            cell.lbldsgno.text = "\(item.prescribedby)"
            cell.lblNotes.text = item.note
            cell.lblfromto.text = item.fromdate
            cell.lblFreq.text = "\(item.frequency)"
            cell.lblmg.text = item.dosage
             return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }

   

}


