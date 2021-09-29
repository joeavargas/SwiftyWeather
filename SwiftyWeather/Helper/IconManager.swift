//
//  IconManager.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/29/21.
//

import UIKit

func returnIconImage(from icon: String) -> UIImage{
    
    switch icon {
    // Clear
    case "01d":
        return UIImage(systemName: "sun.max.fill")!
    case "01n":
        return UIImage(systemName: "moon.stars.fill")!
        
    // Cloudy
    case "02d":
        return UIImage(systemName: "cloud.fill")!
    case "02n":
        return UIImage(systemName: "cloud.moon.fill")!
    case "03d":
        return UIImage(systemName: "cloud.fill")!
    case "03n":
        return UIImage(systemName: "cloud.moon.fill")!
    case "04d":
        return UIImage(systemName: "cloud.fill")!
    case "04n":
        return UIImage(systemName: "cloud.moon.fill")!
        
    // Rain / Thunderstorm
    case "09d":
        return UIImage(systemName: "cloud.rain.fill")!
    case "09n":
        return UIImage(systemName: "cloud.rain.fill")!
    case "10d":
        return UIImage(systemName: "cloud.heavyrain.fill")!
    case "10n":
        return UIImage(systemName: "cloud.heavyrain.fill")!
    case "11d":
        return UIImage(systemName: "cloud.sun.bolt.fill")!
    case "11n":
        return UIImage(systemName: "cloud.moon.bolt.fill")!
        
    // Snow
    case "13d":
        return UIImage(systemName: "snow.fill")!
    case "13n":
        return UIImage(systemName: "snow.fill")!
        
    // Fog
    case "50d":
        return UIImage(systemName: "cloud.fog.fill")!
    case "50n":
        return UIImage(systemName: "cloud.fog.fill")!
    default:
        return UIImage(systemName: "exclamationmark.triangle")!
    }
}
