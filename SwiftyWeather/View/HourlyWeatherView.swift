//
//  HourlyWeatherView.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/28/21.
//

import SwiftUI

struct HourlyWeatherView: View {
    
    var hourOfDay: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
            VStack {
                Text(hourOfDay)
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

//struct HourlyWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        HourlyWeatherView()
//    }
//}
