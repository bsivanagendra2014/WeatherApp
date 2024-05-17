//
//  SearchBar.swift
//  WeatherApp
//
//  Created by BODA SIVA NAGENDRA on 16/05/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var cityName: String
    var onSearch: () -> Void

    var body: some View {
        HStack {
            TextField("Enter city name", text: $cityName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                onSearch()
            }) {
                Text("Search")
            }
            .padding()
        }
    }
}

