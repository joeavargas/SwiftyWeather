//
//  DailyWeatherView.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/28/21.
//

import SwiftUI

struct DailyWeatherView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Text(dayOfWeek)
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

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(dayOfWeek: "10 AM", imageName: "sun.max.fill", temperature: 73)
    }
}
