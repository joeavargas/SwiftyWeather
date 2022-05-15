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
            
            TextField("Search city...", text: $searchCity) {(_) in} onCommit: {
                cityViewModel.getWeatherForSearched(city: searchCity)
                searchCity = ""
                UIApplication.shared.endEditing()
            }
            .padding(.leading, 20)
            .foregroundColor(.secondary)
            
            
            Button {
                cityViewModel.getWeatherForSearched(city: searchCity)
                searchCity = ""
                UIApplication.shared.endEditing()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.purple))
                    
                    Image(systemName: "magnifyingglass")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.purple.opacity(0.5))
            
        })
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(cityViewModel: CityViewViewModel.init())
    }
}
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
