
import 'package:flutter/material.dart';
import 'package:weather_app/model/hourly_weather.dart';
import 'package:weather_app/view/widgets/hourly_weather_item.dart';

class HourlyWeatherList extends StatelessWidget {
  final List<HourlyWeather>? hourlyWeather;

  const HourlyWeatherList({super.key, required this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeather!.length,
        itemBuilder: (context, index) {
          return HourlyWeatherItem(hourlyWeather: hourlyWeather![index]);
        },
      ),
    );
  }
}