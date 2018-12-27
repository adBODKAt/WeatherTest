//
//  AppConstant.swift
//  WeatherTest
//
//  Created by adBODKAt on 27.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation

struct AppConstant {
}

extension AppConstant {
    struct Api {
        static let host: String = "https://api.openweathermap.org"
        static let apiKey: String = "3503e5fa85ab3cdc64471a2daa03c819"
        static let cityId: Int = 1486209
    }
    struct ApiSettings {
        static let lang: String = "ru"
        static let units: String = "metric"
    }
}
