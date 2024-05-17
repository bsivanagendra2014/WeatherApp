//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by BODA SIVA NAGENDRA on 16/05/24.
//

import SwiftUI

struct CurrentWeatherView: View {
  var weather: Weather

  var body: some View {
    ZStack(alignment: .topLeading) { // Use ZStack for layering elements

      // Background gradient with dynamic colors based on temperature
      LinearGradient(gradient: temperatureGradient(for: weather.main.temp), startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all) // Extend background to entire screen

      VStack(alignment: .leading, spacing: 10) { // Content stack
        HStack { // City and temperature
          Text(weather.weather.first?.description.capitalized ?? "")
          Spacer()
          Text("\(Int(weather.main.temp))°C")
            .font(.largeTitle)
            .foregroundColor(.white)
        }
        .padding(.top)

        Text("Humidity: \(weather.main.humidity)%")
          .foregroundColor(.white)
        Text("Wind Speed: \(weather.wind.speed) m/s")
          .foregroundColor(.white)
      }
      .padding()
    }
  }

  private func temperatureGradient(for temperature: Double) -> Gradient {
    if temperature <= 0 { // Cold temperatures
      return Gradient(colors: [.blue, .gray])
    } else if temperature <= 20 { // Cool temperatures
      return Gradient(colors: [.blue, .cyan])
    } else if temperature <= 30 { // Warm temperatures
      return Gradient(colors: [.orange, .yellow])
    } else { // Hot temperatures
      return Gradient(colors: [.red, .orange])
    }
  }
}
