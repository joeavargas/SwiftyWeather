//
//  Day.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/22/21.
//

import Foundation

struct Day: Hashable {
    let day: String
    let image: String
    let temp: Int
}

struct DailyWeatherData {
    
    static let dailyForecast = [
        Day(day: "TUE", image: "sun.max.fill", temp: 72),
        Day(day: "WED", image: "cloud.sun.fill", temp: 73),
        Day(day: "THU", image: "sun.max.fill", temp: 73),
        Day(day: "FRI", image: "cloud.sun.fill", temp: 72),
        Day(day: "SAT", image: "sun.max.fill", temp: 72),
    ]
    
}
