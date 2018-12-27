//
//
//
//
//
//
//

import Foundation

protocol RouteHandler: class {
    @discardableResult func handleRoute(_ route: RouteItem) -> [Presentable]
}

class RouteItem {
    
    enum ItemType {
        case main
    }
    
    let type: ItemType
    var subRoute: RouteItem?
    
    init(type: ItemType, subRoute: RouteItem? = nil) {
        self.type = type
        self.subRoute = subRoute
    }
    
}
