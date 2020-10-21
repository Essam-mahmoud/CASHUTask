//
//  HomePageModel.swift
//  CASHU
//
//  Created by Smart Zone on 10/20/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class HomePageModel: BaseModel{
    
    var data : ProductData = ProductData()
    var errors : String?
    var meta : String?

    override func mapping(map: Map) {

        data <- map["data"]
        errors <- map["errors"]
        meta <- map["meta"]
    }
    
    func getHomeData(success: SuccessClosure?, failure: FailureClosure?) {
        let request = RequestConfiguraton(withRequestMethod: .get, endpoint: Endpoint.user.main.path, encoding: JSONEncoding.default, model: self)
        self.startApiRequest(withRequestConfiguration: request, success: success, failure: failure)
    }
}


class ProductData : BaseModel {
    
    var products : [Products] = [Products]()
    var message : String?

    override func mapping(map: Map) {

        products <- map["products"]
        message <- map["message"]
    }

}
