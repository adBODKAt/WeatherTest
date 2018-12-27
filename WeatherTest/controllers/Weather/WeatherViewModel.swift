//
//  WeatherViewModel.swift
//  WeatherTest
//
//  Created by Александр Марков on 24/12/2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherViewOutput {
    func configure(input: WeatherViewModel.Input) -> WeatherViewModel.Output
    func viewReady()
}

class WeatherViewModel: WeatherViewOutput {
    
    // MARK: In/Out struct
    struct InputDependencies {

    }
    
    struct Input {
        var weatherDataLoaded: ((CityWeatherModel?, Error?)->Void)
        var loadBlock: ((Bool)->Void)
    }
    
    struct Output {
    }
    
    // MARK: Dependencies
    private let dp: InputDependencies
    private let moduleInputData: ModuleInputData
    
    // MARK: Properties
    private var weatherDataLoaded: ((CityWeatherModel?, Error?)->Void)? = nil
    private var loadBlock: ((Bool)->Void)? = nil
    
    private let weatherService = WeatherService()
    
    // MARK: - initializer
    init(dependencies: InputDependencies, moduleInputData: ModuleInputData) {
        self.dp = dependencies
        self.moduleInputData = moduleInputData
    }
    
    // MARK: - AdvertFavoritesViewOutput
    
    func configure(input: Input) -> Output {
        // Configure input
        weatherDataLoaded = input.weatherDataLoaded
        loadBlock = input.loadBlock
        // Configure output
        return Output()
    }
    
    // MARK: - Module configuration
    
    func configureModule(input: ModuleInput?) -> ModuleOutput {
        // Configure input signals
        // Configure module output
        return ModuleOutput()
    }
    
    // MARK: - Additional
    func viewReady() {
        loadWeatherData()
    }
    
    func loadWeatherData() {
        loadBlock?(true)
        weatherService.loadWeather({ [weak self] (model) in
            self?.loadBlock?(false)
            self?.weatherDataLoaded?(model, nil)
        }) { [weak self] (error) in
            self?.loadBlock?(false)
            self?.weatherDataLoaded?(nil, error)
        }
    }
    
    deinit {
        print("-- AdvertFavoritesViewModel dead")
    }
}
