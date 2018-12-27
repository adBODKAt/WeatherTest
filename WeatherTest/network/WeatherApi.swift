//
//
//
//
//
//
//


import Foundation
import UIKit
import Moya

enum WeatherApi {
    case getWeather
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
            return URL(string: AppConstant.Api.host)!
        }
    }
    var path: String {
        switch self {
        case .getWeather :
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
        var params: [String : Any] = [:]
        switch self {
        case .getWeather:
            params["id"] = AppConstant.Api.cityId
            params["APPID"] = AppConstant.Api.apiKey
            params["units"] = AppConstant.ApiSettings.units
            params["lang"] = AppConstant.ApiSettings.lang
        }
        return params
    }
    
    var sampleData: Data {
        return Data()
    }
    var headers: [String: String]? {
        switch self {
        case .getWeather:
            return ["Accept": "application/json"]
        }
    }
    var parameterEncoding: Moya.ParameterEncoding {
        return method == .get ? URLEncoding() : JSONEncoding()
    }
}

