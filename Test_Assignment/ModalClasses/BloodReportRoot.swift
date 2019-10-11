//
//  BloodReportRoot.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 21, 2019

import Foundation
import SwiftyJSON


class BloodReportRoot : NSObject, NSCoding{

    var bloodpressure : BloodReportBloodpressure!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        let bloodpressureJson = json["bloodpressure"]
        if !bloodpressureJson.isEmpty{
            bloodpressure = BloodReportBloodpressure(fromJson: bloodpressureJson)
        }
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if bloodpressure != nil{
        	dictionary["bloodpressure"] = bloodpressure.toDictionary()
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		bloodpressure = aDecoder.decodeObject(forKey: "bloodpressure") as? BloodReportBloodpressure
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if bloodpressure != nil{
			aCoder.encode(bloodpressure, forKey: "bloodpressure")
		}

	}

}
