//
//  ForecastView.swift
//  WeatherApp
//
//  Created by BODA SIVA NAGENDRA on 16/05/24.
//

import SwiftUI

struct ForecastView: View {
  var forecast: [Weather]

  var body: some View {
    VStack {
      ForEach(forecast, id: \.dt) { weather in
        HStack {
          Text(dateString(from: weather.dt))
            .foregroundColor(.gray)
          Spacer()
          Text("\(Int(weather.main.temp_min))°C - \(Int(weather.main.temp_max))°C")
          Spacer()
          Text(weather.weather.first?.description.capitalized ?? "")
            .foregroundColor(temperatureColor(for: weather.main.temp))
        }
        .padding()
        .background(temperatureBackground(for: weather.main.temp))
      }
    }
  }

  private func dateString(from timeInterval: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: timeInterval)
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter.string(from: date)
  }

  private func temperatureColor(for temperature: Double) -> Color {
    if temperature <= 0 {
      return .blue // Cold
    } else if temperature <= 20 {
      return .green // Cool
    } else if temperature <= 30 {
      return .orange // Warm
    } else {
      return .red // Hot
    }
  }

  private func temperatureBackground(for temperature: Double) -> some View {
    Color(white: 0.95) // Slightly transparent background
      .opacity(temperature <= 0 ? 0.3 : 0.1) // Adjust opacity based on temperature
  }
}
