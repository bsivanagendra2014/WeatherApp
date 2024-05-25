//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by BODA SIVA NAGENDRA on 16/05/24.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var currentWeather: Weather?
    @Published var forecast: [Weather] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private let apiKey = "b2a4f55ba70967fdfde180047574d37f"
    private let baseURL = "https://api.openweathermap.org/data/2.5/"

    func fetchWeather(for city: String) {
        isLoading = true
        errorMessage = nil
        
        let weatherURL = "\(baseURL)weather?q=\(city)&appid=\(apiKey)&units=metric"
        let forecastURL = "\(baseURL)forecast?q=\(city)&appid=\(apiKey)&units=metric"

        let weatherPublisher = URLSession.shared.dataTaskPublisher(for: URL(string: weatherURL)!)
            .map { $0.data }
            .decode(type: Weather.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()

        let forecastPublisher = URLSession.shared.dataTaskPublisher(for: URL(string: forecastURL)!)
            .map { $0.data }
            .decode(type: Forecast.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()

        Publishers.Zip(weatherPublisher, forecastPublisher)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { weather, forecast in
                self.currentWeather = weather
                self.forecast = self.filterNextThreeDays(from: forecast.list)
            })
            .store(in: &cancellables)
    }

    private func filterNextThreeDays(from forecast: [Weather]) -> [Weather] {
        var filteredForecast: [Weather] = []
        var lastAddedDay: String?

        let calendar = Calendar.current
        for weather in forecast {
            let date = Date(timeIntervalSince1970: weather.dt)
            let day = calendar.component(.day, from: date)
            let dayString = String(day)
            if lastAddedDay == nil || lastAddedDay != dayString {
                filteredForecast.append(weather)
                lastAddedDay = dayString
            }
            if filteredForecast.count == 3 {
                break
            }
        }
        return filteredForecast
    }
}
