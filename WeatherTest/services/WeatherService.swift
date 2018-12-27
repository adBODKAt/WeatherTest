//
//  WeatherService.swift
//  WeatherTest
//
//  Created by adBODKAt on 25.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

protocol WeatherServiceProtocol {
    func loadWeather(_ completion: @escaping (CityWeatherModel) -> Void, _ failed: ((Error)->Void)?)
}

class WeatherService: WeatherServiceProtocol {
    func loadWeather(_ completion: @escaping (CityWeatherModel) -> Void, _ failed: ((Error)->Void)?) {
        Network.request(.getWeather, { (response) in
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any],
                    let model = CityWeatherModel(JSON: jsonObject) {
                    completion(model)
                } else {
                    let error = NSError(domain: "app", code: -1, userInfo: [NSLocalizedDescriptionKey: "Не удалось обработать данные с сервера"])
                    failed?(error as Error)
                }
            } catch {
                failed?(error)
            }
        }) { (error) in
            failed?(error)
        }
    }
}
