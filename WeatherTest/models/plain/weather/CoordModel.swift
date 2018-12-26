//
//  CoordModel.swift
//  WeatherTest
//
//  Created by adBODKAt on 26.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation
import ObjectMapper

public struct CoordModel: Mappable, Equatable {
    
    var lat: Double = 0
    var lon: Double = 0
    
    init() {}
    
    public init?(map: Map){}
    
    mutating public func mapping(map: Map) {
        lat <- map["lat"]
        lon <- map["lon"]
    }
    
    func isNew() -> Bool {
        return (lat == 0) && (lon == 0)
    }
    
    public static func == (lhs: CoordModel, rhs: CoordModel) -> Bool {
        if lhs.lat != rhs.lat { return false }
        if lhs.lon != rhs.lon { return false }
        
        return true
    }
}
