//
//  MainModel.swift
//  WeatherTest
//
//  Created by adBODKAt on 26.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation
import ObjectMapper

public struct MainModel: Mappable, Equatable {
    
    var humidity: Int = 0
    var pressure: Int = 0
    var temp: Int = 0
    var temp_max: Int = 0
    var temp_min: Int = 0
    
    init() {}
    
    public init?(map: Map){}
    
    mutating public func mapping(map: Map) {
        humidity <- map["humidity"]
        pressure <- map["pressure"]
        temp <- map["temp"]
        temp_max <- map["temp_max"]
        temp_min <- map["temp_min"]
    }
    
    func isNew() -> Bool {
        return pressure == 0
    }
    
    public static func == (lhs: MainModel, rhs: MainModel) -> Bool {
        if lhs.humidity != rhs.humidity { return false }
        if lhs.pressure != rhs.pressure { return false }
        if lhs.temp != rhs.temp { return false }
        if lhs.temp_max != rhs.temp_max { return false }
        if lhs.temp_min != rhs.temp_min { return false }
        
        return true
    }
}
