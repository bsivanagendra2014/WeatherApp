//
//  Weather.swift
//  WeatherApp
//
//  Created by BODA SIVA NAGENDRA on 16/05/24.
//

import Foundation

struct Weather: Codable {
    let main: Main
    let weather: [WeatherCondition]
    let wind: Wind
    let dt: TimeInterval
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
    let temp_min: Double
    let temp_max: Double
}

struct WeatherCondition: Codable {
    let description: String
    let icon: String
}

struct Wind: Codable {
    let speed: Double
}

struct Forecast: Codable {
    let list: [Weather]
}
