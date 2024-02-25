import 'package:flutter/material.dart';
import 'package:weather_app/model/hourly_weather.dart';

class HourlyWeatherItem extends StatelessWidget {
  final HourlyWeather hourlyWeather;

  const HourlyWeatherItem({super.key, required this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${hourlyWeather.time.hour}:00',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Icon(
            hourlyWeather.icon,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            '${hourlyWeather.temperature}°C',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            hourlyWeather.description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
