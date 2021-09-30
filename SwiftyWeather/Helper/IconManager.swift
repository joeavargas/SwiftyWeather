//
//  IconManager.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/29/21.
//

import UIKit
import SwiftUI

func returnIconImage(from icon: String) -> String{
    
    switch icon {
    // Clear
    case "01d":
        return "sun.max.fill"
    case "01n":
        return "moon.stars.fill"
        
    // Cloudy
    case "02d":
        return "cloud.fill"
    case "02n":
        return "cloud.moon.fill"
    case "03d":
        return "cloud.fill"
    case "03n":
        return "cloud.moon.fill"
    case "04d":
        return "cloud.fill"
    case "04n":
        return "cloud.moon.fill"
        
    // Rain / Thunderstorm
    case "09d":
        return "cloud.rain.fill"
    case "09n":
        return "cloud.rain.fill"
    case "10d":
        return "cloud.heavyrain.fill"
    case "10n":
        return "cloud.heavyrain.fill"
    case "11d":
        return "cloud.sun.bolt.fill"
    case "11n":
        return "cloud.moon.bolt.fill"
        
    // Snow
    case "13d":
        return "snow.fill"
    case "13n":
        return "snow.fill"
        
    // Fog
    case "50d":
        return "cloud.fog.fill"
    case "50n":
        return "cloud.fog.fill"
    default:
        return "exclamationmark.triangle"
    }
}
