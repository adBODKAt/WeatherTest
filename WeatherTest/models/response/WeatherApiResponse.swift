//
//  PlatioApiResponse.swift
//  market-core
//
//  Created by adBODKAt on 29.08.2018.
//  Copyright © 2018 East Media Ltd. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherApiResponse: Mappable {
    var message: String = ""
    var result: Int
    
    let apiDomain = "ru.weather"
    
    required init?(map: Map){
        guard let r = map.JSON["Code"] as? Int else {
            return nil
        }
        result = r
    }
    
    func mapping(map: Map) {
        message <- map["Message"]
    }
    
    var isSuccess:Bool {
        get { return result == 0 }
    }
    
    func error() -> Error? {
        if isSuccess == true { return nil }
        
        let userInfo = [
            NSLocalizedDescriptionKey: (message.count > 0) ? message : "Unknow error occure"
        ]
        let error = NSError(domain: apiDomain, code: result, userInfo: userInfo)
        
        return error as Error
    }
}

/*
 {
 base = stations;
 
 clouds =     {
 all = 20;//Cloudiness, %
 };
 
 cod = 200;
 
 coord =     {
 lat = "56.86";
 lon = "60.61";
 };
 
 rain
 rain.1h Rain volume for the last 1 hour
 rain.3h Rain volume for the last 3 hours
 snow
 snow.1h Snow volume for the last 1 hour
 snow.3h Snow volume for the last 3 hours
 
 dt = 1545726600;
 
 id = 1486209;
 
 main =     {
 humidity = 76;//Humidity, %
 pressure = 1035;
 temp = "-21";
 "temp_max" = "-21";
 "temp_min" = "-21";
 };
 
 name = Yekaterinburg;
 
 sys =     {
 country = RU;
 id = 8985;
 message = "0.0207";
 sunrise = 1545712489;//unix, UTC
 sunset = 1545736840;//unix, UTC
 type = 1;
 };
 
 visibility = 10000;
 
 weather =     (
 {
 description = "\U043d\U0435\U0431\U043e\U043b\U044c\U0448\U043e\U0439 \U0441\U043d\U0435\U0433\U043e\U043f\U0430\U0434";
 icon = 13d;
 id = 600;
 main = Snow;
 }
 );
 
 wind =     {
 deg = 140;
 speed = 6; // m/s
 };
 }
 
 
 */
