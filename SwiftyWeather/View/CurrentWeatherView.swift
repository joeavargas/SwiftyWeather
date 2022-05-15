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
        
        VStack(spacing: 10) {
            Text(weatherVM.cityAndState)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.none)
                .padding(.horizontal)
            Text(weatherVM.sublocality ?? "")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.none)
                .padding(.bottom)
            
            Image(systemName: returnIconImage(from: weatherVM.weatherIcon))
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text("\(weatherVM.temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.none)
        }
        .padding(.bottom, 40)
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(weatherVM: CityViewViewModel.init())
    }
}
