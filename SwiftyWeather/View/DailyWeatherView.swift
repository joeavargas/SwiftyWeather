//
//  DailyWeatherView.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/28/21.
//

import SwiftUI

struct DailyWeatherView: View {
    
    @ObservedObject var weatherVM: CityViewViewModel
    
    var body: some View {
        ForEach(weatherVM.weather.daily){ dailyWeather in
            LazyVStack {
                dailyCell(dailyWeather: dailyWeather)
            }
        }
    }
    
    private func dailyCell(dailyWeather: DailyWeather) -> some View {
        HStack {
            Text(weatherVM.getDayFor(timestamp: dailyWeather.dt).uppercased())
                .frame(width: 50)
            
            Spacer()
            
            Image(systemName: returnIconImage(from: dailyWeather.weather[0].icon))
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Spacer()
            
            Text("\(weatherVM.getTempFor(temp: dailyWeather.temp.day))℉")
            
        }
        .padding(.top)
        .padding(.horizontal, 50)
    }
}
