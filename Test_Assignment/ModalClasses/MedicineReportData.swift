//
//  MedicineReportData.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 21, 2019

import Foundation
import SwiftyJSON


class MedicineReportData : NSObject, NSCoding{

    var daysOfWeek : AnyObject!
    var dosage : String!
    var everyDay : Int!
    var frequency : Int!
    var fromDate : String!
    var id : Int!
    var medicineName : String!
    var medicineTimes : [MedicineReportMedicineTime]!
    var monthlyDailyFlag : Int!
    var note : String!
    var prescribeBy : Int!
    var repeatAfterDays : Int!
    var toDate : String!
    var userId : Int!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        daysOfWeek = json["days_of_week"] as AnyObject
        dosage = json["dosage"].stringValue
        everyDay = json["every_day"].intValue
        frequency = json["frequency"].intValue
        fromDate = json["from_date"].stringValue
        id = json["id"].intValue
        medicineName = json["medicine_name"].stringValue
        medicineTimes = [MedicineReportMedicineTime]()
        let medicineTimesArray = json["medicine_times"].arrayValue
        for medicineTimesJson in medicineTimesArray{
            let value = MedicineReportMedicineTime(fromJson: medicineTimesJson)
            medicineTimes.append(value)
        }
        monthlyDailyFlag = json["monthly_daily_flag"].intValue
        note = json["note"].stringValue
        prescribeBy = json["prescribe_by"].intValue
        repeatAfterDays = json["repeat_after_days"].intValue
        toDate = json["to_date"].stringValue
        userId = json["user_id"].intValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if daysOfWeek != nil{
        	dictionary["days_of_week"] = daysOfWeek
        }
        if dosage != nil{
        	dictionary["dosage"] = dosage
        }
        if everyDay != nil{
        	dictionary["every_day"] = everyDay
        }
        if frequency != nil{
        	dictionary["frequency"] = frequency
        }
        if fromDate != nil{
        	dictionary["from_date"] = fromDate
        }
        if id != nil{
        	dictionary["id"] = id
        }
        if medicineName != nil{
        	dictionary["medicine_name"] = medicineName
        }
        if medicineTimes != nil{
        var dictionaryElements = [[String:Any]]()
        for medicineTimesElement in medicineTimes {
        	dictionaryElements.append(medicineTimesElement.toDictionary())
        }
        dictionary["medicineTimes"] = dictionaryElements
        }
        if monthlyDailyFlag != nil{
        	dictionary["monthly_daily_flag"] = monthlyDailyFlag
        }
        if note != nil{
        	dictionary["note"] = note
        }
        if prescribeBy != nil{
        	dictionary["prescribe_by"] = prescribeBy
        }
        if repeatAfterDays != nil{
        	dictionary["repeat_after_days"] = repeatAfterDays
        }
        if toDate != nil{
        	dictionary["to_date"] = toDate
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
		daysOfWeek = aDecoder.decodeObject(forKey: "days_of_week") as? AnyObject
		dosage = aDecoder.decodeObject(forKey: "dosage") as? String
		everyDay = aDecoder.decodeObject(forKey: "every_day") as? Int
		frequency = aDecoder.decodeObject(forKey: "frequency") as? Int
		fromDate = aDecoder.decodeObject(forKey: "from_date") as? String
		id = aDecoder.decodeObject(forKey: "id") as? Int
		medicineName = aDecoder.decodeObject(forKey: "medicine_name") as? String
		medicineTimes = aDecoder.decodeObject(forKey: "medicine_times") as? [MedicineReportMedicineTime]
		monthlyDailyFlag = aDecoder.decodeObject(forKey: "monthly_daily_flag") as? Int
		note = aDecoder.decodeObject(forKey: "note") as? String
		prescribeBy = aDecoder.decodeObject(forKey: "prescribe_by") as? Int
		repeatAfterDays = aDecoder.decodeObject(forKey: "repeat_after_days") as? Int
		toDate = aDecoder.decodeObject(forKey: "to_date") as? String
		userId = aDecoder.decodeObject(forKey: "user_id") as? Int
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if daysOfWeek != nil{
			aCoder.encode(daysOfWeek, forKey: "days_of_week")
		}
		if dosage != nil{
			aCoder.encode(dosage, forKey: "dosage")
		}
		if everyDay != nil{
			aCoder.encode(everyDay, forKey: "every_day")
		}
		if frequency != nil{
			aCoder.encode(frequency, forKey: "frequency")
		}
		if fromDate != nil{
			aCoder.encode(fromDate, forKey: "from_date")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if medicineName != nil{
			aCoder.encode(medicineName, forKey: "medicine_name")
		}
		if medicineTimes != nil{
			aCoder.encode(medicineTimes, forKey: "medicine_times")
		}
		if monthlyDailyFlag != nil{
			aCoder.encode(monthlyDailyFlag, forKey: "monthly_daily_flag")
		}
		if note != nil{
			aCoder.encode(note, forKey: "note")
		}
		if prescribeBy != nil{
			aCoder.encode(prescribeBy, forKey: "prescribe_by")
		}
		if repeatAfterDays != nil{
			aCoder.encode(repeatAfterDays, forKey: "repeat_after_days")
		}
		if toDate != nil{
			aCoder.encode(toDate, forKey: "to_date")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "user_id")
		}

	}

}
