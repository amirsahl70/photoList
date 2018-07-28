//
//  HTTPHandler.swift
//  jsonPractice
//
//  Created by Amir on 7/14/2016.
//  Copyright © 2018 uni. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HttpHandler{
    
    static func dataRequest(url :URL, completionHandler : @escaping (JSON) -> Void  ){
        Alamofire.request(url).validate().responseJSON{ response in
            switch response.result{
            case .success:
                if let value = response.result.value{
                    let json = JSON(value)
                    completionHandler(json)
                }
            case .failure(let error) : print("error->\(error)")
            
            }
    
        }
    }
}

