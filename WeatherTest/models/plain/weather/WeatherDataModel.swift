//
//  WeatherModel.swift
//  WeatherTest
//
//  Created by adBODKAt on 26.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

//С именем файла "WeatherModel.swift" XCode отчаянно ругался, что ни модель, ни файл найти не может
//Пришлось переименовать

import Foundation
import ObjectMapper

public struct WeatherDataModel: Mappable, Equatable {
    
    var description: String = ""
    var icon: String = ""
    var id: Int = 0
    var main: String = ""
    
    init() {}
    
    public init?(map: Map){}
    
    mutating public func mapping(map: Map) {
        description <- map["description"]
        icon <- map["icon"]
        id <- map["id"]
        main <- map["main"]
    }
    
    func isNew() -> Bool {
        return id == 0
    }
    
    public static func == (lhs: WeatherDataModel, rhs: WeatherDataModel) -> Bool {
        if lhs.description != rhs.description { return false }
        if lhs.icon != rhs.icon { return false }
        if lhs.id != rhs.id { return false }
        if lhs.main != rhs.main { return false }
        
        return true
    }
}
