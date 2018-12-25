//
//  Api.swift
//  Market Core
//
//  Created by Dmitry Avvakumov on 05.03.2018.
//  Copyright © 2018 East Media Ltd. All rights reserved.
//

import Foundation
import UIKit
import Moya

enum WeatherApi {
    case getTime
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

extension WeatherApi: TargetType {
    var baseURL: URL {
        switch self {
        default:
            return URL(string: "https://api.openweathermap.org")!
        }
    }
    var path: String {
        switch self {
        case .getTime :
            return "data/2.5/weather"
        }
    }
    var url: String {
        if path.count > 0 {
            return "\(baseURL)/\(path)"
        } else {
            return "\(baseURL)"
        }
    }
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
        
    }
    var task: Task {
        return .requestParameters(parameters: (parameters) ?? [:], encoding: parameterEncoding)
    }
    var parameters: [String : Any]? {
        //1486209
        var params: [String : Any] = [:]
        switch self {
        case .getTime:
            params["id"] = 1486209
            params["APPID"] = "3503e5fa85ab3cdc64471a2daa03c819"
            params["units"] = "metric"
            params["lang"] = "ru"
            //3503e5fa85ab3cdc64471a2daa03c819
        }
        return params
    }
    
    var sampleData: Data {
        return Data()
    }
    var headers: [String: String]? {
        switch self {
        case .getTime:
            return ["Accept": "application/json", "X-Api-Version" : "1.0"]
        }
    }
    var parameterEncoding: Moya.ParameterEncoding {
        return method == .get ? URLEncoding() : JSONEncoding()
    }
}

