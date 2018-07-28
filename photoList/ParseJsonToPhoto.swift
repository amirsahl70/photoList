//
//  ParseJsonToPhoto.swift
//  jsonPractice
//
//  Created by Amir on 7/14/2016.
//  Copyright © 2018 uni. All rights reserved.
//

import Foundation
import SwiftyJSON

class parsJSONToPhoto{

    static func parseData (json :JSON) -> [photo]{
        var photoArray : [photo] = []
        
        for(_,data): (String, JSON) in json{
            let id = data["id"].stringValue
            let title = data["title"].stringValue
            let thumbnail = data["thumbnailUrl"].stringValue
             //print("id = \(id)")
            let item = photo(id : id , title : title, thumbnail : thumbnail)
            photoArray.append(item)
            
        }
    return photoArray
    }
    
}
