import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _WeatherService = WeatherService('808ee2563e92c9724bd82ffbcee344dc');
  Weather? _weather;

  // fetch the weather data from the api
  _fetchWeather() async {
    // get the current city name
    String cityName = await _WeatherService.getCurrentCity();

    // get the weather data for this city
    try {
      final weather = await _WeatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    // error handling
    catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  // animations for the weather
  String getWeatherAnimation(String condition) {
    switch (condition) {
      case 'Clear':
        return 'assets/clear.json';
      case 'Clouds':
        return 'assets/cloudy.json';
      case 'Rain':
        return 'assets/rain.json';
      case 'Snow':
        return 'assets/snow.json';
      case 'Thunderstorm':
        return 'assets/rain.json';
      case 'Drizzle':
        return 'assets/rain.json';
      case 'night':
        return 'assets/night.json';
      case 'snow':
        return 'assets/snow.json';
      default:
        return 'assets/clear.json';
    }
  }

  // init state
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // city name
          Text(_weather?.cityName ?? 'Loading...',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          // animation
          Lottie.asset(
            getWeatherAnimation(_weather?.mainCondition ?? 'Clear'),
            width: 200,
            height: 200,
          ),

          // temperature
          Text('${_weather?.temperature.round() ?? 'Loading...'}°C',
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),

          // weather condition
          Text(_weather?.mainCondition ?? 'Loading...',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          // refresh button
          ElevatedButton(
            onPressed: _fetchWeather,
            child: const Text('Refresh'),
          ),
        ],        
      ),
    );
  }
}
