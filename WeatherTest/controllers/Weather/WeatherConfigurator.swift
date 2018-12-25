//
//  WeatherConfigurator.swift
//  WeatherTest
//
//  Created by Александр Марков on 24/12/2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import UIKit

class WeatherConfigurator {
    class func configure(data:WeatherViewModel.ModuleInputData) throws
        -> (viewController: UIViewController, moduleOutput:WeatherViewModel.ModuleOutput) {
            return try WeatherConfigurator.configure(moduleInput: nil, data: data)
    }
    
    class func configure(moduleInput: WeatherViewModel.ModuleInput?,
                         data:WeatherViewModel.ModuleInputData) throws
        -> (viewController: UIViewController, moduleOutput:WeatherViewModel.ModuleOutput) {
            // View controller
            let viewController = createViewController()
            
            // Dependencies
            let dependencies = try createDependencies()
            
            // View model
            let viewModel = WeatherViewModel(dependencies: dependencies, moduleInputData: data)
            let moduleOutput = viewModel.configureModule(input: moduleInput)
            
            viewController.viewModel = viewModel
            
            return (viewController, moduleOutput)
    }
    
    private class func createViewController() -> WeatherViewController {
        return WeatherViewController()
    }
    
    private class func createDependencies() throws -> WeatherViewModel.InputDependencies {
        let dependencies =
            WeatherViewModel.InputDependencies()
        return dependencies
    }
    
}
