//
//  BloodReportData.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 21, 2019

import Foundation
import SwiftyJSON


class BloodReportData : NSObject, NSCoding{

    var createdAt : String!
    var createdBy : Int!
    var dateTime : String!
    var deletedAt : AnyObject!
    var diastolic : Int!
    var emailSent : Int!
    var heartBeats : Int!
    var id : Int!
    var notes : String!
    var pulse : Int!
    var systolic : Int!
    var updatedAt : String!
    var updatedBy : Int!
    var userId : Int!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        createdAt = json["created_at"].stringValue
        createdBy = json["created_by"].intValue
        dateTime = json["date_time"].stringValue
        deletedAt = json["deleted_at"] as AnyObject
        diastolic = json["diastolic"].intValue
        emailSent = json["email_sent"].intValue
        heartBeats = json["heart_beats"].intValue
        id = json["id"].intValue
        notes = json["notes"].stringValue
        pulse = json["pulse"].intValue
        systolic = json["systolic"].intValue
        updatedAt = json["updated_at"].stringValue
        updatedBy = json["updated_by"].intValue
        userId = json["user_id"].intValue
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
        if createdBy != nil{
        	dictionary["created_by"] = createdBy
        }
        if dateTime != nil{
        	dictionary["date_time"] = dateTime
        }
        if deletedAt != nil{
        	dictionary["deleted_at"] = deletedAt
        }
        if diastolic != nil{
        	dictionary["diastolic"] = diastolic
        }
        if emailSent != nil{
        	dictionary["email_sent"] = emailSent
        }
        if heartBeats != nil{
        	dictionary["heart_beats"] = heartBeats
        }
        if id != nil{
        	dictionary["id"] = id
        }
        if notes != nil{
        	dictionary["notes"] = notes
        }
        if pulse != nil{
        	dictionary["pulse"] = pulse
        }
        if systolic != nil{
        	dictionary["systolic"] = systolic
        }
        if updatedAt != nil{
        	dictionary["updated_at"] = updatedAt
        }
        if updatedBy != nil{
        	dictionary["updated_by"] = updatedBy
        }
        if userId != nil{
        	dictionary["user_id"] = userId
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
		createdBy = aDecoder.decodeObject(forKey: "created_by") as? Int
		dateTime = aDecoder.decodeObject(forKey: "date_time") as? String
		deletedAt = aDecoder.decodeObject(forKey: "deleted_at") as? AnyObject
		diastolic = aDecoder.decodeObject(forKey: "diastolic") as? Int
		emailSent = aDecoder.decodeObject(forKey: "email_sent") as? Int
		heartBeats = aDecoder.decodeObject(forKey: "heart_beats") as? Int
		id = aDecoder.decodeObject(forKey: "id") as? Int
		notes = aDecoder.decodeObject(forKey: "notes") as? String
		pulse = aDecoder.decodeObject(forKey: "pulse") as? Int
		systolic = aDecoder.decodeObject(forKey: "systolic") as? Int
		updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
		updatedBy = aDecoder.decodeObject(forKey: "updated_by") as? Int
		userId = aDecoder.decodeObject(forKey: "user_id") as? Int
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
		if createdBy != nil{
			aCoder.encode(createdBy, forKey: "created_by")
		}
		if dateTime != nil{
			aCoder.encode(dateTime, forKey: "date_time")
		}
		if deletedAt != nil{
			aCoder.encode(deletedAt, forKey: "deleted_at")
		}
		if diastolic != nil{
			aCoder.encode(diastolic, forKey: "diastolic")
		}
		if emailSent != nil{
			aCoder.encode(emailSent, forKey: "email_sent")
		}
		if heartBeats != nil{
			aCoder.encode(heartBeats, forKey: "heart_beats")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if notes != nil{
			aCoder.encode(notes, forKey: "notes")
		}
		if pulse != nil{
			aCoder.encode(pulse, forKey: "pulse")
		}
		if systolic != nil{
			aCoder.encode(systolic, forKey: "systolic")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if updatedBy != nil{
			aCoder.encode(updatedBy, forKey: "updated_by")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "user_id")
		}

	}

}
