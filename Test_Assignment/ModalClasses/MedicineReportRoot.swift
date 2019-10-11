//
//  MedicineReportRoot.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 21, 2019

import Foundation
import SwiftyJSON


class MedicineReportRoot : NSObject, NSCoding{

    var medicines : MedicineReportMedicine!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        let medicinesJson = json["medicines"]
        if !medicinesJson.isEmpty{
            medicines = MedicineReportMedicine(fromJson: medicinesJson)
        }
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if medicines != nil{
        	dictionary["medicines"] = medicines.toDictionary()
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		medicines = aDecoder.decodeObject(forKey: "medicines") as? MedicineReportMedicine
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if medicines != nil{
			aCoder.encode(medicines, forKey: "medicines")
		}

	}

}
