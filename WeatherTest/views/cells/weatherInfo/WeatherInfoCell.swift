//
//  WeatherInfoCell.swift
//  WeatherTest
//
//  Created by adBODKAt on 26.12.2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import UIKit

class WeatherInfoCell: UITableViewCell, TableCellProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {}
    func setupView() {
    }
    func configureWithModel(model: TableRawProtocol, animated: Bool) {
        guard let m = model as? WeatherInfoRow else {
            return
        }
        
        titleLabel.text = m.getTitle()
        infoLabel.text = m.getInfo()
    }
    
}
