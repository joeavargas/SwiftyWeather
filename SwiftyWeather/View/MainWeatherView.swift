//
//  ContentView.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/22/21.
//

import SwiftUI

struct MainWeatherView: View {
    
    var dailyWeatherData: [Day] = DailyWeatherData.dailyForecast
    var hourlyWeatherData: [Hour] = HourWeatherData.hourlyForecast
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color("lightBlue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                CurrentWeatherView(cityName: "Houston", iconName: "sun.max.fill", temp: 72)
                
                
                
                
                Spacer()
                
                ScrollView(.vertical) {
                    ForEach(dailyWeatherData, id: \.self){ day in
                        DailyWeatherView(dayOfWeek: day.day, imageName: day.image, temperature: day.temp)
                    }
                }
                .padding(.top)
                .padding(.horizontal, 50)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView()
    }
}

struct WeatherHourView: View {
    
    var hourOfDay: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Text(hourOfDay)
                .font(.system(size: 20, weight: .medium))
                . foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Spacer()
            
            Text("\(temperature)")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
