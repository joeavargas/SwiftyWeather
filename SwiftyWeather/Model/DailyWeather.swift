//
//  DailyWeather.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/29/21.
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    var date: Int
    var temp: Temperature
    var weather: [WeatherDetail]
    
    enum CodingKey: String {
        case date = "dt"
        case temp, weather
    }
    
    // Initialize an empty state
    init(){
        date = 0
        temp = Temperature(day: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
}

extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}
