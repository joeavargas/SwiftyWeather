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
        .foregroundColor(Color(#colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)))
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]), startPoint: .top, endPoint: .trailing))
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView()
    }
}

