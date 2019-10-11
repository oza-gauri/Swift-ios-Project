//
//  CoreDataManager.swift
//  Test_Assignment
//
//  Created by Aress Software Pvt Ltd on 19/09/19.
//  Copyright © 2019 Aress Software Pvt Ltd. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    //MARK:- Variables Declaration
    static var shareInstance = CoreDataManager()
    //context is declared globally
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object: [String: String]) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        user.firstname = object["firstname"]
        user.lastname = object["lastname"]
        user.username = object["username"]
        user.email = object["email"]
        user.password = object["password"]
        do {
            try context?.save()
        } catch  {
            print("Data is not saved")
        }
    }
    
    //to fetch the user record
    func getUserData() -> [User] {
        var user = [User]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        do {
            user = try context?.fetch(fetchRequest) as! [User]
        } catch {
            print("Cannot get data")
        }
        return user
    }
    //to fetch the bloodpressure record
    func getbpData() -> [BloodReport] {
        var bpr = [BloodReport]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "BloodReport")
        do {
            bpr = try context?.fetch(fetchRequest) as! [BloodReport]
        } catch {
            print("Cannot get data")
        }
        return bpr
    }
    //to fetch the medicine record
    func getmedicinedata() -> [Medicines] {
        var med = [Medicines]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Medicines")
        do {
            med = try context?.fetch(fetchRequest) as! [Medicines]
        } catch {
            print("Cannot get data")
        }
        return med
    }
}


