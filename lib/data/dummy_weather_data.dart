import 'package:flutter/material.dart';
import 'package:weather_app/model/hourly_weather.dart';
import 'package:weather_app/model/weather_model.dart';

List<WeatherModel> dummyWeatherData = [
  WeatherModel(
    date: DateTime.now().subtract(Duration(days: 3)),
    title: 'Sunny',
    description: 'Clear sky',
    hourlyWeather: List.generate(24, (index) {
      return HourlyWeather(
        time: DateTime.now().subtract(const Duration(days: 3)).add(Duration(hours: index)),
        title: 'Sunny',
        description: 'Clear sky',
        temperature: 25 + index.toDouble(),
        icon: Icons.wb_sunny, 
      );
    }),
  ),
  WeatherModel(
    date: DateTime.now().subtract(const Duration(days: 2)),
    title: 'Cloudy',
    description: 'Partly cloudy',
    hourlyWeather: List.generate(24, (index) {
      return HourlyWeather(
        time: DateTime.now().subtract(const Duration(days: 2)).add(Duration(hours: index)),
        title: 'Cloudy',
        description: 'Partly cloudy',
        temperature: 20 + index.toDouble(),
        icon: Icons.cloud, 
      );
    }),
  ),
  WeatherModel(
    date: DateTime.now().subtract(const Duration(days: 1)),
    title: 'Rainy',
    description: 'Light rain showers',
    hourlyWeather: List.generate(24, (index) {
      return HourlyWeather(
        time: DateTime.now().subtract(const Duration(days: 1)).add(Duration(hours: index)),
        title: 'Rainy',
        description: 'Light rain showers',
        temperature: 15 + index.toDouble(),
        icon: Icons.grain, 
      );
    }),
  ),
  WeatherModel(
    date: DateTime.now(),
    title: 'Snowy',
    description: 'Heavy snowfall',
    hourlyWeather: List.generate(24, (index) {
      return HourlyWeather(
        time: DateTime.now().add(Duration(hours: index)),
        title: 'Snowy',
        description: 'Heavy snowfall',
        temperature: 0 + index.toDouble(),
        icon: Icons.ac_unit, 
      );
    }),
  ),
];