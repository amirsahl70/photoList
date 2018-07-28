//
//  Photo.swift
//  jsonPractice
//
//  Created by Amir on 7/14/2016.
//  Copyright © 2018 uni. All rights reserved.
//

import Foundation

class photo{
    
    var id :String?
    var title : String?
    var thumbnail :  String?
    
    init(id : String, title : String, thumbnail: String) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
    }
}
