//
//  User+CoreDataProperties.swift
//  Test_Assignment
//
//  Created by Aress Software Pvt Ltd on 19/09/19.
//  Copyright © 2019 Aress Software Pvt Ltd. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
  
}
