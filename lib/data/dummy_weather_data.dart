import 'package:flutter/material.dart';
import 'package:weather_app/model/hourly_weather.dart';
import 'package:weather_app/model/weather_model.dart';

List<WeatherModel> dummyWeatherData = [
  for (var i = 0; i < 4; i++)
    WeatherModel(
      date: DateTime.now().add(Duration(days: i)),
      title: _getTitleForDay(i),
      description: _getDescriptionForDay(i),
      iconUrl: _getIconUrlForDay(i),
      hourlyWeather: List.generate(24, (index) {
        return HourlyWeather(
          time: DateTime.now().add(Duration(days: i, hours: index)),
          title: _getTitleForDay(i),
          description: _getDescriptionForDay(i),
          temperature: _getTemperatureForHour(index),
          icon: _getIconForDay(i),
        );
      }),
    ),
];

String _getTitleForDay(int dayIndex) {
  switch (dayIndex) {
    case 0:
      return 'Sunny';
    case 1:
      return 'Cloudy';
    case 2:
      return 'Rainy';
    case 3:
      return 'Snowy';
    default:
      return '';
  }
}

String _getDescriptionForDay(int dayIndex) {
  switch (dayIndex) {
    case 0:
      return 'Clear sky';
    case 1:
      return 'Partly cloudy';
    case 2:
      return 'Light rain showers';
    case 3:
      return 'Heavy snowfall';
    default:
      return '';
  }
}

String _getIconUrlForDay(int dayIndex) {
  switch (dayIndex) {
    case 0:
      return 'assets/images/sun.png';
    case 1:
      return 'assets/images/cloud.png';
    case 2:
      return 'assets/images/rain.png';
    case 3:
      return 'assets/images/snow.png';
    default:
      return '';
  }
}

double _getTemperatureForHour(int hourIndex) {
  // Replace with your logic to generate temperature based on hour
  return hourIndex.toDouble();
}

IconData _getIconForDay(int dayIndex) {
  switch (dayIndex) {
    case 0:
      return Icons.wb_sunny;
    case 1:
      return Icons.cloud;
    case 2:
      return Icons.grain;
    case 3:
      return Icons.ac_unit;
    default:
      return Icons.error;
  }
}
