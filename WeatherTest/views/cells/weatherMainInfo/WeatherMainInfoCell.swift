//
//  WeatherMainInfoCell.swift
//  WeatherTest
//
//  Created by adBODKAt on 26.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import UIKit

class WeatherMainInfoCell: UITableViewCell, TableCellProtocol {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var degreasLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {}
    
    func setupView() {
    }
    func configureWithModel(model: TableRawProtocol, animated: Bool) {
        guard let m = model as? WeatherMainInfoRow else {
            return
        }
        
        cityLabel.text = m.getCityName()
        weatherDescriptionLabel.text = m.getWeatherDescription()
        degreasLabel.text = m.getDegrees()
    }
    
}
