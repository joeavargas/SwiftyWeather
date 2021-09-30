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
            VStack(spacing: 0) {
                
                SearchBarView(cityViewModel: weatherVM)
                    .padding()
                
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
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView()
    }
}

