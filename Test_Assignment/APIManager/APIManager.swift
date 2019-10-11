//
//  APIManager.swift
//  Test_Assignment
//
//  Created by Aress Software Pvt Ltd on 21/09/19.
//  Copyright © 2019 Aress Software Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class APIManager: NSObject {
    
    static let sharedInstanceAPI = APIManager()
    
    
    func requestGetURL(strURL : String, success:@escaping (JSON) -> Void, failure:@escaping (String) -> Void){
        
        if (NetworkReachabilityManager()?.isReachable)! {
            
            Alamofire.request(strURL, method: .get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response
                in
                switch response.result {
                case .success:
                    let resJson = JSON(response.result.value!)
                    success(resJson)
                    print("Network Available")
                case .failure:
                    let error : Error = response.result.error!
                    failure(error.localizedDescription)
                   
                }
            })
            
        }
        else {
            let msg = "Network not available!";
            failure(msg)
        }
    }
    
    
}

