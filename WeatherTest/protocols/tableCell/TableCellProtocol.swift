//
//  TableCellProtocol.swift
//  Market Core
//
//  Created by adBODKAt on 12.04.2018.
//  Copyright © 2018 East Media Ltd. All rights reserved.
//

import Foundation
import UIKit

protocol TableCellProtocol {
    func configureWithModel(model: TableRawProtocol, animated:Bool)
}
