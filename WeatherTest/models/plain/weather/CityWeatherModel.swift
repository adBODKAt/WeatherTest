//
//  CityWeatherModel.swift
//  WeatherTest
//
//  Created by adBODKAt on 26.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation
import ObjectMapper

public struct CityWeatherModel: Mappable, Equatable {
    
    var base: String = ""
    var clouds: CloudModel? = nil
    var cod: Int = 0
    var coord: CoordModel? = nil
    var dt: Double = 0
    var id: Int = 0
    var main: MainModel? = nil
    var name: String = ""
    var sys: SysModel? = nil
    var visibility: Int = 0
    var weather: [WeatherDataModel]? = nil
    var wind: WindModel? = nil
    
    init() {}
    
    public init?(map: Map){}
    
    mutating public func mapping(map: Map) {
        base <- map["base"]
        clouds <- map["clouds"]
        cod <- map["cod"]
        coord <- map["coord"]
        dt <- map["dt"]
        id <- map["id"]
        main <- map["main"]
        name <- map["name"]
        sys <- map["sys"]
        visibility <- map["visibility"]
        weather <- map["weather"]
        wind <- map["wind"]
    }
    
    func isNew() -> Bool {
        return id == 0
    }
    
    public static func == (lhs: CityWeatherModel, rhs: CityWeatherModel) -> Bool {
        if lhs.base != rhs.base { return false }
        if lhs.clouds != rhs.clouds { return false }
        if lhs.cod != rhs.cod { return false }
        if lhs.coord != rhs.coord { return false }
        if lhs.dt != rhs.dt { return false }
        if lhs.id != rhs.id { return false }
        if lhs.main != rhs.main { return false }
        if lhs.name != rhs.name { return false }
        if lhs.sys != rhs.sys { return false }
        if lhs.visibility != rhs.visibility { return false }
        if lhs.weather != rhs.weather { return false }
        if lhs.wind != rhs.wind { return false }
        
        return true
    }
}
