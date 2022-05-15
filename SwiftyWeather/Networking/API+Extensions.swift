//
//  API+Extensions.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/29/21.
//

import Foundation

extension API {
    static let baseUrlString = "https://api.openweathermap.org/data/2.5/"
    
    static func getUrlFor(lat: Double, lon: Double) -> String {
        return "\(baseUrlString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,alerts&appid=\(API_KEY)&units=imperial"
    }
}
