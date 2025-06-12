# Weather App

A Flutter weather application that shows current weather conditions based on your location.

## Features

- Current weather conditions
- Temperature in Celsius
- Weather animations
- Location-based weather
- Auto-refresh capability

## Setup

1. Clone the repository
2. Get an API key from [OpenWeather](https://openweathermap.org/api)
3. Open `lib/config.dart` and replace `YOUR_API_KEY_HERE` with your OpenWeather API key
4. Run `flutter pub get` to install dependencies
5. Run `flutter run` to start the app

## Required Permissions

The app requires the following permissions:
- Location access (to get your current city)

## Dependencies

- flutter
- http
- geocoding
- lottie
- geolocator

## Assets

Make sure to add the following Lottie animation files in the `assets` directory:
- clear.json
- cloudy.json
- rain.json
- snow.json
- night.json
