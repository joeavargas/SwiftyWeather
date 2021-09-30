//
//  CurrentWeatherView.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/28/21.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @ObservedObject var weatherVM: CityViewViewModel
    
    var body: some View {
        Text(weatherVM.city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.black)
            .padding()
        
        VStack(spacing: 10) {
            Image(uiImage: returnIconImage(from: weatherVM.weatherIcon))
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(weatherVM.temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.black)
        }
        .padding(.bottom, 40)
    }
}

