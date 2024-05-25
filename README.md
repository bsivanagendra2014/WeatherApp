# Weather App

## Overview

This simple weather app is built using Swift and SwiftUI, following the MVVM (Model-View-ViewModel) architecture. It fetches current weather and a 3-day forecast for a specified city using the OpenWeatherMap API.

## Features

- Search bar for entering the city name.
- Displays current weather including temperature, condition, humidity, and wind speed.
- Shows a 3-day weather forecast with high/low temperatures and conditions.
- Loading indicator while fetching data.
- Error messages for invalid city names or API errors.

## Prerequisites

- Xcode 12 or later
- Swift 5.3 or later
- A valid OpenWeatherMap API key

## Setup Instructions

1. **Clone the repository:**

    ```sh
    git clone https://github.com/yourusername/WeatherApp.git
    cd WeatherApp
    ```

2. **Open the project in Xcode:**

    ```sh
    open WeatherApp.xcodeproj
    ```

3. **Add your OpenWeatherMap API key:**

    Open `WeatherViewModel.swift` and replace `"YOUR_API_KEY"` with your actual API key.

    ```swift
    private let apiKey = "YOUR_API_KEY"
    ```

4. **Build and run the project:**

    - Select the appropriate simulator or device.
    - Press `Cmd + R` to build and run the app.

## Architecture

### MVVM (Model-View-ViewModel)

- **Model:**
  - Contains data structures for weather information (`Weather`, `Main`, `WeatherCondition`, `Wind`, `Forecast`).
  - These structures conform to `Codable` for easy JSON decoding.

- **View:**
  - `WeatherView`: Main view containing search bar, current weather, and forecast sections.
  - `SearchBar`: Custom view for entering city names.
  - `CurrentWeatherView`: Displays the current weather details.
  - `ForecastView`: Lists the 3-day weather forecast.

- **ViewModel:**
  - `WeatherViewModel`: Handles data fetching from the OpenWeatherMap API, processes the data, and updates the views. Uses Combine for asynchronous data handling.

## Libraries Used

- **Combine:**
  - Used for handling asynchronous network requests and updating the views accordingly.

## Assumptions and Additional Features

- **Assumptions:**
  - The user will enter valid city names.
  - The OpenWeatherMap API will respond with valid data for given city names.

- **Additional Features:**
  - Displays error messages for invalid city names or network issues.
  - A loading indicator is shown while data is being fetched.

## Possible Improvements

- **Caching:**
  - Implement caching to reduce API calls and improve performance.
  
- **Localization:**
  - Add support for multiple languages.

- **Additional Data:**
  - Display more detailed weather information, such as sunrise and sunset times, or hourly forecasts.

- **Unit Tests:**
  - Add unit tests for the ViewModel and networking components.
