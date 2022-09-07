//
//  APIService.swift
//  MilkShopping
//
//  Created by Will on 2022/9/5.
//

import UIKit

class APIService {
    
    struct MSAPIRequest: APIRequest {
        
        typealias Response = MSRecords
        
        var path: String { "/Drinks" }
        var amount: Int?
        var queryItems: [URLQueryItem]? {
            var query = [URLQueryItem(name: "api_key", value: "keyzFbtD11imUm6Zv")]
            if let amount = amount {
                query.append(URLQueryItem(name: "filterByFormula", value: "amount=\(amount)"))
            }
            return query
        }
    }
    
    struct ImageRequest: APIRequest {
        typealias Response = UIImage
        var imageID: String
        var path: String { "/images/" + imageID }
    }

}
