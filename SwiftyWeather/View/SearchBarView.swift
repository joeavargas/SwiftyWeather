//
//  SearchBarView.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/29/21.
//

import SwiftUI

struct SearchBarView: View {
    
    @ObservedObject var cityViewModel: CityViewViewModel
    @State private var searchCity = ""
    
    var body: some View {
        HStack {
            
            Spacer()
            
            TextField("Search city...", text: $searchCity)
                .padding(.leading, 20)
                .foregroundColor(.secondary)
            
            Button {
                cityViewModel.city = searchCity
                searchCity = ""
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(K.Colors.searchButtonColor)
                    
                    Image(systemName: "magnifyingglass")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 10)
                .fill(K.Colors.searchTextFieldColor)
            
        })
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(cityViewModel: CityViewViewModel.init())
    }
}
