//
//  Weather.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/29/21.
//

import Foundation

struct Weather: Codable, Identifiable {
    var date: Int
    var temp: Double
    var weather: [WeatherDetail]
    
    enum CodinKey: String {
        case date = "dt"
        case temp, weather
    }
    
    // Initialize an empty state
    init(){
        date = 0
        temp = 0.0
        weather = []
    }
}

extension Weather {
    var id: UUID {
        return UUID()
    }
}
