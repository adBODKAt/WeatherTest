//
//  WeatherSimpleRows.swift
//  WeatherTest
//
//  Created by adBODKAt on 27.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation

enum WeatherSimpleRows: CaseIterable {
    case minTemp
    case maxTemp
    case humidity
    case pressure
    case sunrise
    case sunset
    case visibility
    case windSpeed
    case windRoute
}

extension WeatherSimpleRows {
    
    func title() -> String {
        switch self {
        case .minTemp:
            return "Минимальная температура"
        case .maxTemp:
            return "Максимальаня температура"
        case .humidity:
            return "Влажность"
        case .pressure:
            return "Давление"
        case .sunrise:
            return "Восход солнца"
        case .sunset:
            return "Заход солнца"
        case .visibility:
            return "Видимость"
        case .windSpeed:
            return "Ветер"
        case .windRoute:
            return "Направление ветра"
        }
    }
    
    func printableValue() -> String {
        switch self {
        case .minTemp:
            return "°"
        case .maxTemp:
            return "°"
        case .humidity:
            return "%"
        case .pressure:
            return " мм рт. ст."
        case .sunrise:
            return ""
        case .sunset:
            return ""
        case .visibility:
            return " м"
        case .windSpeed:
            return " м/с"
        case .windRoute:
            return ""
        }
    }
}

extension CityWeatherModel {
    func getStringValue(_ forRow: WeatherSimpleRows) -> String {
        var retValue: String = ""
        switch forRow {
        case .minTemp:
            if let main = self.main {
                retValue = String(main.temp_min)
            }
        case .maxTemp:
            if let main = self.main {
                retValue = String(main.temp_max)
            }
        case .humidity:
            if let main = self.main {
                retValue = String(main.humidity)
            }
        case .pressure:
            if let main = self.main {
                retValue = String(main.pressure)
            }
        case .sunrise:
            if let sys = self.sys {
                retValue = timeFromTimestamp(sys.sunrise)
            }
        case .sunset:
            if let sys = self.sys {
                retValue = timeFromTimestamp(sys.sunset)
            }
        case .visibility:
            return String(self.visibility)
        case .windSpeed:
            if let wind = self.wind {
                retValue = String(wind.speed)
            }
        case .windRoute:
            if let wind = self.wind {
                retValue = degreesToString(wind.deg)
            }
        }
        
        return retValue
    }
    
    func timeFromTimestamp(_ time: Double) -> String {
        let date = Date(timeIntervalSince1970: time)
        let stringFormat = DateFormatter(withFormat: "HH:mm", locale: "")
        return stringFormat.string(from: date)
    }
    
    func degreesToString(_ deg: Int) -> String {
        switch deg {
        case 0...22, 338...360:
            return "Северный"
        case 23...67:
            return "Северо-Восточный"
        case 68...112:
            return "Восточный"
        case 113...157:
            return "Юго-Восточный"
        case 158...202:
            return "Южный"
        case 203...247:
            return "Юго-Западный"
        case 248...292:
            return "Западный"
        case 293...337:
            return "Северо-Западный"
        default:
            return ""
        }
    }
}
