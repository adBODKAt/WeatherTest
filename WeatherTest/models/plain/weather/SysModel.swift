//
//  SysModel.swift
//  WeatherTest
//
//  Created by adBODKAt on 26.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation
import ObjectMapper

public struct SysModel: Mappable, Equatable {
    
    var id: Int = 0
    var message: String = ""
    var sunrise: Double = 0
    var sunset: Double = 0
    var type: Int = 0
    var country: String = ""
    
    init() {}
    
    public init?(map: Map){}
    
    mutating public func mapping(map: Map) {
        id <- map["id"]
        message <- map["message"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
        type <- map["type"]
        country <- map["country"]
    }
    
    func isNew() -> Bool {
        return id == 0
    }
    
    public static func == (lhs: SysModel, rhs: SysModel) -> Bool {
        if lhs.id != rhs.id { return false }
        if lhs.message != rhs.message { return false }
        if lhs.sunrise != rhs.sunrise { return false }
        if lhs.sunset != rhs.sunset { return false }
        if lhs.type != rhs.type { return false }
        if lhs.country != rhs.country { return false }
        
        return true
    }
}
