import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/const/colors.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/widgets/hourly_weather_list.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('EEEE, MMMM dd');
    final String formattedDate = dateFormat.format(weather.date!);

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors:[ AppColors.primaryColor, AppColors.backgroundColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formattedDate,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                weather.title!,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${weather.description}',
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.backgroundColor,
                ),
              ),
              const SizedBox(height: 16),
              HourlyWeatherList(hourlyWeather: weather.hourlyWeather),
            ],
          ),
        ),
      ),
    );
  }
}
