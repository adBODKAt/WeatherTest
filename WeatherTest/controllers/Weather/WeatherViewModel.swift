//
//  WeatherViewModel.swift
//  WeatherTest
//
//  Created by Александр Марков on 24/12/2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation

protocol WeatherViewOutput {
    func configure(input: WeatherViewModel.Input) -> WeatherViewModel.Output
}

class WeatherViewModel: WeatherViewOutput {
    
    // MARK: In/Out struct
    struct InputDependencies {

    }
    
    struct Input {

    }
    
    struct Output {
    }
    
    // MARK: Dependencies
    private let dp: InputDependencies
    private let moduleInputData: ModuleInputData
    
    // MARK: Properties
    
    // MARK: Observables
    
    // MARK: - initializer
    
    init(dependencies: InputDependencies, moduleInputData: ModuleInputData) {
        self.dp = dependencies
        self.moduleInputData = moduleInputData
    }
    
    // MARK: - AdvertFavoritesViewOutput
    
    func configure(input: Input) -> Output {
        // Configure input
        // Configure output
        return Output()
    }
    
    // MARK: - Module configuration
    
    func configureModule(input: ModuleInput?) -> ModuleOutput {
        // Configure input signals
        let weatherService = WeatherService()
        weatherService.loadWeather({ (model) in
            //
        }) { (error) in
            //show error
        }
        // Configure module output
        return ModuleOutput()
    }
    
    func restoreTableData() {
    }
    
    // MARK: - Additional
    
    deinit {
        print("-- AdvertFavoritesViewModel dead")
    }
}
