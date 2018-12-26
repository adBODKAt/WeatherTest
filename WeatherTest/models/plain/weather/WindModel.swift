//
//  WindModel.swift
//  WeatherTest
//
//  Created by adBODKAt on 26.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation
import ObjectMapper

public struct WindModel: Mappable, Equatable {
    
    var deg: Int = 0
    var speed: Int = 0
    
    init() {}
    
    public init?(map: Map){}
    
    mutating public func mapping(map: Map) {
        deg <- map["deg"]
        speed <- map["speed"]
    }
    
    func isNew() -> Bool {
        return (speed == 0) && (deg == 0)
    }
    
    public static func == (lhs: WindModel, rhs: WindModel) -> Bool {
        if lhs.deg != rhs.deg { return false }
        if lhs.speed != rhs.speed { return false }
        
        return true
    }
}
