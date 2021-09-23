//
//  Hour.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/22/21.
//

import Foundation

struct Hour: Hashable {
    let hour: String
    let image: String
    let temp: Int
}

struct HourWeatherData {
    
    static let hourlyForecast = [
        Hour(hour: "1pm", image: "sun.max.fill", temp: 72),
        Hour(hour: "2pm", image: "cloud.sun.fill", temp: 73),
        Hour(hour: "3pm", image: "sun.max.fill", temp: 73),
        Hour(hour: "4pm", image: "cloud.sun.fill", temp: 72),
        Hour(hour: "5pm", image: "sun.max.fill", temp: 72),
    ]
    
}
