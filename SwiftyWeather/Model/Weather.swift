//
//  Weather.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/29/21.
//

import Foundation

struct Weather: Codable, Identifiable {
    var dt: Int
    var temp: Double
    var weather: [WeatherDetail]
    
    enum CodinKey: String {
        case dt,temp, weather
    }
    
    // Initialize an empty state
    init(){
        dt = 0
        temp = 0.0
        weather = []
    }
}

extension Weather {
    var id: UUID {
        return UUID()
    }
}
