//
//  Category.swift
//  CASHU
//
//  Created by Smart Zone on 10/20/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import Foundation
import ObjectMapper

class Category : BaseModel {
    
    var createdAt : String?
    var updatedAt : String?
    var id : Int?
    var name_en : String?
    var name_ar : String?
    var is_active : Bool?
    var link : Link?

    override func mapping(map: Map) {

        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        id <- map["id"]
        name_en <- map["name_en"]
        name_ar <- map["name_ar"]
        is_active <- map["is_active"]
        link <- map["Link"]
    }

}

class Links : BaseModel {
    var createdAt : String?
    var updatedAt : String?
    var id : Int?
    var target_type : String?
    var target_id : Int?
    var link : String = ""
    var link_type : String?
    var is_active : Bool?

    override func mapping(map: Map) {

        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        id <- map["id"]
        target_type <- map["target_type"]
        target_id <- map["target_id"]
        link <- map["link"]
        link_type <- map["link_type"]
        is_active <- map["is_active"]
    }

}


class Link : BaseModel {
    var createdAt : String?
    var updatedAt : String?
    var id : Int?
    var target_type : String?
    var target_id : Int?
    var link : String?
    var link_type : String?
    var is_active : Bool?

    override func mapping(map: Map) {

        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        id <- map["id"]
        target_type <- map["target_type"]
        target_id <- map["target_id"]
        link <- map["link"]
        link_type <- map["link_type"]
        is_active <- map["is_active"]
    }

}



