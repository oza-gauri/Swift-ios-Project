//
//  BloodReport+CoreDataProperties.swift
//  
//
//  Created by Aress Software Pvt Ltd on 25/09/19.
//
//

import Foundation
import CoreData


extension BloodReport {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BloodReport> {
        return NSFetchRequest<BloodReport>(entityName: "BloodReport")
    }

    @NSManaged public var systolic: Int64
    @NSManaged public var diastolic: Int64
    @NSManaged public var pulse: Int64

}
