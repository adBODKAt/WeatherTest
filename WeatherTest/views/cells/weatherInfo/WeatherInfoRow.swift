//
//  WeatherInfoRow.swift
//  WeatherTest
//
//  Created by adBODKAt on 26.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import UIKit

class WeatherInfoRow: TableRow {
    typealias Identity = String
    
    var title: String = ""
    var info: String = ""
    
    override var cellIdentifier: String {
        return "WeatherInfoCell"
    }
    
    override var identity: String {
        return title + info
    }
    
    override func equalTo(other: TableRow) -> Bool {
        if let rhs = other as? WeatherInfoRow  {
            let lhs = self
            if rhs.title != lhs.title { return false }
            if rhs.info != lhs.info { return false }
            return true
        }
        return false
    }
    
    func getTitle() -> String {
        return title
    }
    func getInfo() -> String {
        return info
    }
}
