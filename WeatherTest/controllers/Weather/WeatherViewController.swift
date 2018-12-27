//
//  WeatherViewController.swift
//  WeatherTest
//
//  Created by Александр Марков on 24/12/2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDataSource {
    
    // MARK: - Properties
    
    // Dependencies
    var viewModel: WeatherViewOutput?
    
    // Public
    
    // Private
    private var dataSource = WeatherTableDataModel()
    
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
        
        self.viewModel?.viewReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: - Configuration
    
    private func configure() {
        guard let model = viewModel, let customView = self.customView else {
            return
        }
        
        customView.tableView.dataSource = self
        
        let weatherBlock: ((CityWeatherModel?, Error?) -> Void) = { [weak self] (model, error) in
            self?.acceptData(model, error)
        }
        let loadBlock: ((Bool) -> Void) = { [customView] (loading) in
            if loading {
                customView.showLoadIndicator()
            } else {
                customView.hideLoadIndicator()
            }
        }
        
        let input = WeatherViewModel.Input(weatherDataLoaded: weatherBlock,
                                           loadBlock: loadBlock)
        let _ = model.configure(input: input)

    }
    
    private func configureUI() {
    }
    
    private func acceptData(_ model: CityWeatherModel?, _ error: Error?) {
        guard let customView = self.customView else {
            return
        }
        if let m = model {
            dataSource.configureWithData(city: m)
            customView.tableView.reloadData()
        } else if let err = error {
            //show error
            let alert = UIAlertController.init(title: "Ошибка", message: err.localizedDescription, preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "Ок", style: UIAlertAction.Style.cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Additional
    
    deinit {
        print("AdvertFavoritesViewController deinit")
    }
}

extension WeatherViewController {//TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource.cellModel(at: indexPath, forTable: tableView)
    }
}
