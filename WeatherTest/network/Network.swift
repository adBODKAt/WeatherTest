//
//  Network.swift
//  Getpass
//
//  Created by Dmitry Avvakumov on 06.12.16.
//  Copyright © 2016  Dmitry Avvakumov. All rights reserved.
//
import Moya
import Alamofire

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
    static func request(_ target: WeatherApi, _ completion: @escaping ((Response?, Error?)->Void)) {
        provider.request(target) { (result) in
            switch result {
            case .success(let data):
                do {
                    let parsed = try data.mapJSON()
                    print("\(parsed)")
                    completion(data, nil)
                } catch {
                    //
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

