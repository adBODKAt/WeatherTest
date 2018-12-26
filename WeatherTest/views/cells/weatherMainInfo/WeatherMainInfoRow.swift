//
//  WeatherMainInfoRow.swift
//  WeatherTest
//
//  Created by adBODKAt on 26.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import UIKit

class WeatherMainInfoRow: TableRow {
    typealias Identity = String
    
    var cityName: String = ""
    var weatherDescription: String = ""
    var degrees: Int?
    
    override var cellIdentifier: String {
        return "WeatherMainInfoCell"
    }
    
    override var identity: String {
        return cityName
    }
    
    override func equalTo(other: TableRow) -> Bool {
        if let rhs = other as? WeatherMainInfoRow  {
            let lhs = self
            if rhs.cityName != lhs.cityName { return false }
            if rhs.weatherDescription != lhs.weatherDescription { return false }
            if rhs.degrees != lhs.degrees { return false }
            return true
        }
        return false
    }
    
    func getCityName() -> String {
        return cityName
    }
    func getWeatherDescription() -> String {
        return weatherDescription
    }
    func getDegrees() -> String {
        if let d = degrees {
            return "\(d)"+"°"
        } else {
            return ""
        }
    }
}
