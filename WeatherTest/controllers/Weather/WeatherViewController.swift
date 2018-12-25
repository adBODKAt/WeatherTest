//
//  WeatherViewController.swift
//  WeatherTest
//
//  Created by Александр Марков on 24/12/2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: - Properties
    
    // Dependencies
    var viewModel: WeatherViewOutput?
    
    // Public
    
    // Private
    
    // IBOutlet & UI
    lazy var customView = self.view as? WeatherView
    
    // MARK: - View lifecycle
    override func loadView() {
        let view = WeatherView()
        self.view = view
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Configuration
    
    private func configure() {
        guard let model = viewModel, let customView = self.customView else {
            return
        }
        
        let input = WeatherViewModel.Input()
        let output = model.configure(input: input)
    }
    
    private func configureUI() {
    }
    
    // MARK: - Additional
    
    deinit {
        print("AdvertFavoritesViewController deinit")
    }
}
