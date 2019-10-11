//
//  MedicineReportMedicineTime.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 21, 2019

import Foundation
import SwiftyJSON


class MedicineReportMedicineTime : NSObject, NSCoding{

    var createdAt : String!
    var deletedAt : AnyObject!
    var id : Int!
    var medicineId : Int!
    var quntity : String!
    var takenStatus : Int!
    var time : String!
    var updatedAt : String!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        createdAt = json["created_at"].stringValue
        deletedAt = json["deleted_at"] as AnyObject
        id = json["id"].intValue
        medicineId = json["medicine_id"].intValue
        quntity = json["quntity"].stringValue
        takenStatus = json["taken_status"].intValue
        time = json["time"].stringValue
        updatedAt = json["updated_at"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if createdAt != nil{
        	dictionary["created_at"] = createdAt
        }
        if deletedAt != nil{
        	dictionary["deleted_at"] = deletedAt
        }
        if id != nil{
        	dictionary["id"] = id
        }
        if medicineId != nil{
        	dictionary["medicine_id"] = medicineId
        }
        if quntity != nil{
        	dictionary["quntity"] = quntity
        }
        if takenStatus != nil{
        	dictionary["taken_status"] = takenStatus
        }
        if time != nil{
        	dictionary["time"] = time
        }
        if updatedAt != nil{
        	dictionary["updated_at"] = updatedAt
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
		deletedAt = aDecoder.decodeObject(forKey: "deleted_at") as? AnyObject
		id = aDecoder.decodeObject(forKey: "id") as? Int
		medicineId = aDecoder.decodeObject(forKey: "medicine_id") as? Int
		quntity = aDecoder.decodeObject(forKey: "quntity") as? String
		takenStatus = aDecoder.decodeObject(forKey: "taken_status") as? Int
		time = aDecoder.decodeObject(forKey: "time") as? String
		updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if deletedAt != nil{
			aCoder.encode(deletedAt, forKey: "deleted_at")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if medicineId != nil{
			aCoder.encode(medicineId, forKey: "medicine_id")
		}
		if quntity != nil{
			aCoder.encode(quntity, forKey: "quntity")
		}
		if takenStatus != nil{
			aCoder.encode(takenStatus, forKey: "taken_status")
		}
		if time != nil{
			aCoder.encode(time, forKey: "time")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}

	}

}
