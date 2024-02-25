import 'package:flutter/material.dart';

class HourlyWeather {
  final DateTime time;
  final String title;
  final String description;
  final double temperature;
  final IconData icon;

  HourlyWeather({
    required this.time,
    required this.title,
    required this.description,
    required this.temperature,
    required this.icon,
  });
}
