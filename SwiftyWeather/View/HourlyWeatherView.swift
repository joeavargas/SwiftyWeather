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
                    let hour = weatherVM.getTimeFor(timestamp: hourly.dt)
                    let icon = returnIconImage(from: hourly.weather.count > 0 ? hourly.weather[0].icon : "exclamationmark.triangle")
                    let temp = weatherVM.getTempFor(temp: hourly.temp)
                    getHourlyView(hour: hour, image: Image(systemName: "\(icon)"), temp: temp)
                }
            }
            .padding(.horizontal, 30)
        }
    }
    
    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 20){
            Text(hour)
            image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            Text(temp + "℉")
        }
    }
}
