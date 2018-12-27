//
//
//
//
//
//
//

import Moya
import ObjectMapper

class Network {
    
    static var provider = MoyaProvider<WeatherApi>(
        endpointClosure: { (target) -> Endpoint in
            return Endpoint(
                url: target.url,
                sampleResponseClosure: {.networkResponse(200, target.sampleData)},
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers)})
}

extension Network {
    static func request(_ target: WeatherApi, _ success: @escaping (Response)->Void, _ failure: @escaping (Error)->Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let data):
                success(data)
            case .failure(let error):
                failure(error)
            }
        }
    }
}

