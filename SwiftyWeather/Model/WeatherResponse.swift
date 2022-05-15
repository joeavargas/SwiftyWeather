//
//  WeatherResponse.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/29/21.
//

import Foundation

struct WeatherResponse: Codable {
    var current: Weather
    var hourly: [Weather]
    var daily: [DailyWeather]
    
    // Create an empty Weather Response state
    static func empty() -> WeatherResponse {
        return WeatherResponse(current: Weather(),
                               hourly: [Weather](repeating: Weather(), count: 23), // grab the next 23 hours of hourly data to display
                               daily: [DailyWeather](repeating: DailyWeather(), count: 8)) // grab the next 8 days of daily weather to display
    }
}
