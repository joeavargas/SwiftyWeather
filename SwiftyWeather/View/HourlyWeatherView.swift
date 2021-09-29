//
//  HourlyWeatherView.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/28/21.
//

import SwiftUI

struct HourlyWeatherView: View {
    
    @ObservedObject var weatherVM: CityViewViewModel
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 20) {
                ForEach(weatherVM.weather.hourly){ hourly in
                    let hour = weatherVM.getTimeFor(timestamp: hourly.date)
                    let icon = returnIconImage(from: hourly.weather[0].icon)
                    let temp = weatherVM.getTempFor(temp: hourly.temp)
                    getHourlyView(hour: hour, image: Image(uiImage: icon), temp: temp)
                }
            }
            .padding(.horizontal, 30)
        }
    }
    
    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 20){
            Text(hour)
            image
            Text(temp)
        }
    }
}
