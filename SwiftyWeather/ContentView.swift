//
//  ContentView.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/22/21.
//

import SwiftUI

struct ContentView: View {
    
    var dailyWeatherData: [Day] = DailyWeatherData.dailyForecast
    var hourlyWeatherData: [Hour] = HourWeatherData.hourlyForecast
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color("lightBlue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Houston, TX")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 10) {
                    Image(systemName: "sun.max.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("72°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(dailyWeatherData, id: \.self){ day in
                            WeatherDayView(dayOfWeek: day.day, imageName: day.image, temperature: day.temp)
                        }
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                ScrollView(.vertical) {
                    ForEach(hourlyWeatherData, id: \.self){ hour in
                        
                        WeatherHourView(hourOfDay: hour.hour, imageName: hour.image, temperature: hour.temp)
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
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
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
