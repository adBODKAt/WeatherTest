//
//  TableRawProtocol.swift
//  Market Core
//
//  Created by adBODKAt on 12.04.2018.
//  Copyright © 2018 East Media Ltd. All rights reserved.
//

import Foundation
import UIKit

protocol TableRawProtocol {
    var cellIdentifier: String { get }
    
    func associatedWithNibLayout() -> Bool
}

extension TableRawProtocol {
    func associatedWithNibLayout() -> Bool {
        return true
    }
}

class TableRow: Equatable, TableRawProtocol {
    typealias Identity = String
    
    var cellIdentifier: String {
        return "Cell"
    }
    
    var identity: String {
        return ""
    }
    
    func equalTo(other: TableRow) -> Bool {
        return true
    }
    
    static func == (lhs: TableRow, rhs: TableRow) -> Bool {
        return lhs.equalTo(other: rhs)
    }
    
}

extension UITableView {
    
    func dequeueReusableCellWithRaw(_ raw:TableRawProtocol, indexPath:IndexPath) -> UITableViewCell {
        
        let reuseId = raw.cellIdentifier
        
        if let cell = dequeueReusableCell(withIdentifier: reuseId) {
            return cell
        }
        if raw.associatedWithNibLayout() {
            register(UINib.init(nibName: reuseId, bundle: nil), forCellReuseIdentifier: reuseId)
        } else {
            fatalError("No cellIdentifier found for reuseId \(reuseId)")
        }
        
        return dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
    }
    
}
