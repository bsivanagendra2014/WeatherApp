//
//  WeatherView.swift
//  WeatherApp
//
//  Created by BODA SIVA NAGENDRA on 16/05/24.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    @State private var cityName: String = ""

    var body: some View {
        VStack {
            SearchBar(cityName: $cityName, onSearch: {
                viewModel.fetchWeather(for: cityName)
            })

            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            } else if let currentWeather = viewModel.currentWeather {
                CurrentWeatherView(weather: currentWeather)
                ForecastView(forecast: viewModel.forecast)
            } else {
                Text("Enter a city name to get started")
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    WeatherView()
}

