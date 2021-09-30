//
//  ContentView.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/22/21.
//

import SwiftUI

struct MainWeatherView: View {
    
    @ObservedObject var weatherVM = CityViewViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                
                SearchBarView(cityViewModel: weatherVM)
                    .padding(.top, 50)
                    .padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    CurrentWeatherView(weatherVM: weatherVM)
                    
                    Spacer()
                    
                    HourlyWeatherView(weatherVM: weatherVM)
                    
                    Spacer()
                    
                    DailyWeatherView(weatherVM: weatherVM)
                    
                    Spacer()
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView()
    }
}

