//
//  Medicines+CoreDataProperties.swift
//  
//
//  Created by Aress Software Pvt Ltd on 25/09/19.
//
//

import Foundation
import CoreData


extension Medicines {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medicines> {
        return NSFetchRequest<Medicines>(entityName: "Medicines")
    }

    @NSManaged public var medicinename: String?
    @NSManaged public var note: String?
    @NSManaged public var dosage: String?
    @NSManaged public var fromdate: String?
    @NSManaged public var frequency: Int64
    @NSManaged public var prescribedby: Int64

}
