//
//  CityViewViewModel.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/29/21.
//

import SwiftUI
import CoreLocation

final class CityViewViewModel: ObservableObject {
    
    @Published var weather = WeatherResponse.empty()
    @Published var city: String = "Houston, TX" {
        didSet {
            getLocation()
        }
    }

    init() {
         getLocation()
    }
    
    var date: String {
        return time.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.date)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "exclamationmark.triangle"
    }
    
    var condition: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].description.uppercased()
        }
        return "n/a"
    }
    
    var temperature: String {
        return getTempFor(temp: weather.current.temp)
    }
    
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { placemarks, error in
            if let places = placemarks, let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    
    private func getWeather(coord: CLLocationCoordinate2D?){
        if let coord = coord {
            let urlString = API.getUrlFor(lat: coord.latitude, lon: coord.longitude)
                getWeatherInternal(city: city, for: urlString)
        } else {
            // TODO: create error alert
            print("DEBUG: Error fetching weather", #function)
        }
    }
    
    private func getWeatherInternal(city: String, for urlString: String) {
        NetworkManager<WeatherResponse>.fetchData(from: URL(string: urlString)!) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // MARK: - Helper Functions
    
    func getTimeFor(timestamp: Int) -> String {
        return time.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getDayFor(timestamp: Int) -> String {
        return day.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getTempFor(temp: Double) -> String {
        return String(format: "%.0f", temp)
    }
    
    // MARK: - Time and Date formatters
    
    // Returns "10AM"
    private lazy var time: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h a"
        return formatter
    }()
    
    // Returns "Sunday"
    private lazy var day: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter
    }()
}
