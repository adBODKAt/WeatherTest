//
//  WeatherTableDataSource.swift
//  WeatherTest
//
//  Created by adBODKAt on 26.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherTableDataSource {
    var cellModels:[TableRow] { get }
}

extension WeatherTableDataSource {
    func numberOfRows() -> Int {
        return cellModels.count
    }
    func cellModel(at indexPath: IndexPath, forTable: UITableView) -> UITableViewCell {
        let model = cellModels[indexPath.row]
        let cell = forTable.dequeueReusableCellWithRaw(model, indexPath: indexPath)
        if let c = cell as? TableCellProtocol {
            c.configureWithModel(model: model, animated: true)
        }
        return cell
    }
}
