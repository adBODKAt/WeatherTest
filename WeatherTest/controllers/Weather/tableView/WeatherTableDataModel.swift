//
//  WeatherTableDataModel.swift
//  WeatherTest
//
//  Created by adBODKAt on 27.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation

struct WeatherTableDataModel: WeatherTableDataSource {
    var cellModels: [TableRow] = []
    
    mutating func configureWithData(city: CityWeatherModel) {
        cellModels.removeAll()
        
        /* MainInfoRow */
        let mainRow = configureMainInfoRow(city)
        cellModels.append(mainRow)
        
        /* OtherRows */
        let rows = configureWeatherRows(city)
        cellModels.append(contentsOf: rows)
    }
    
    private func configureMainInfoRow(_ city: CityWeatherModel) -> TableRow {
        let row = WeatherMainInfoRow()
        row.cityName = city.name
        row.weatherDescription = ""
        
        if let main = city.main {
            row.degrees = main.temp
        }
        
        if let weatherArr = city.weather, weatherArr.count > 0 {
            //Массив, но возвращает всегда 1 элемент
            let weather = weatherArr[0]
            row.weatherDescription = weather.description
            //icon
        }
        
        return row
    }
    
    private func configureWeatherRows(_ city: CityWeatherModel) -> [TableRow] {
        var rows = [TableRow]()
        for item in WeatherSimpleRows.allCases {
            let value = city.getStringValue(item) + item.printableValue()
            let row = configureRow(item.title(), value)
            rows.append(row)
        }
        return rows
    }
    private func configureRow(_ title: String, _ value: String) -> TableRow {
        let row = WeatherInfoRow()
        row.title = title
        row.info = value
        return row
    }
}
