//
//  CloudModel.swift
//  WeatherTest
//
//  Created by adBODKAt on 26.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation
import ObjectMapper

public struct CloudModel: Mappable, Equatable {
    
    var all: Int = 0
    
    init() {}
    
    public init?(map: Map){}
    
    mutating public func mapping(map: Map) {
        all <- map["all"]
    }
    
    func isNew() -> Bool {
        return all == 0
    }
    
    public static func == (lhs: CloudModel, rhs: CloudModel) -> Bool {
        if lhs.all != rhs.all { return false }
        
        return true
    }
}
