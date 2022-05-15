//
//  SwiftyWeatherApp.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/22/21.
//

import SwiftUI

@main
struct SwiftyWeatherApp: App {
    
    @ObservedObject var locationManager = LocationManager.shared
    var body: some Scene {
        WindowGroup {
            if locationManager.userLocation == nil {
                LocationRequestView()
            } else {
                MainWeatherView()
            }
        }
    }
}
