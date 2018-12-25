//
//  WeatherService.swift
//  WeatherTest
//
//  Created by adBODKAt on 25.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation
import Moya

protocol WeatherServiceProtocol {
    //
}

class WeatherService: WeatherServiceProtocol {
    
    func loadWeather() {
        Network.request(.getTime) { (response, error) in
            //
        }
    }
    
}
