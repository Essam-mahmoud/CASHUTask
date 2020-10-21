//
//  Products.swift
//  CASHU
//
//  Created by Smart Zone on 10/20/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import Foundation
import ObjectMapper

class Products : BaseModel {
    
    var createdAt : String?
    var updatedAt : String?
    var is_favorite : Bool?
    var id : Int?
    var name_en : String  = ""
    var name_ar : String = ""
    var description_en : String = ""
    var description_ar : String = ""
    var price : Double = 0.0
    var is_active : Bool?
    var is_quantities : Bool?
    var category_id : Int?
    var store_id : Int?
    var seller_id : Int?
    var shareable_link : String?
    var links : [Links]?
    var category : Category?

    override func mapping(map: Map) {

        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        is_favorite <- map["is_favorite"]
        id <- map["id"]
        name_en <- map["name_en"]
        name_ar <- map["name_ar"]
        description_en <- map["description_en"]
        description_ar <- map["description_ar"]
        price <- map["price"]
        is_active <- map["is_active"]
        is_quantities <- map["is_quantities"]
        category_id <- map["category_id"]
        store_id <- map["store_id"]
        seller_id <- map["seller_id"]
        shareable_link <- map["shareable_link"]
        links <- map["Links"]
        category <- map["Category"]
    }

}
