//
//  SearchBarView.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/29/21.
//

import SwiftUI

struct SearchBarView: View {
    
    @ObservedObject var cityViewModel: CityViewViewModel
    @State private var searchCity = "San Francisco"
    
    var body: some View {
        HStack {
            TextField("", text: $searchCity)
                .padding(.leading, 20)
            
            Button {
                cityViewModel.city = searchCity
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading){
            Image(systemName: "magnifyingglass")
                .foregroundColor(.black)
                .padding(.leading, 10)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
            
        })
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(cityViewModel: CityViewViewModel.init())
    }
}
