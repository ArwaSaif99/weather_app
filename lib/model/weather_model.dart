import 'package:flutter/material.dart';
import 'package:weather_app/model/hourly_weather.dart';

class WeatherModel {
  int? id;
  DateTime? date; 
  String? city; 
  String? title;
  String? description;
  String? iconUrl;
  List<HourlyWeather>? hourlyWeather; 
  WeatherModel({
    this.id,
    this.date,
    this.city,
    this.title,
    this.description,
    this.iconUrl,
    required this.hourlyWeather, 
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> hourlyWeatherJson = json['hourlyWeather'] ?? [];
    List<HourlyWeather> hourlyWeatherList = hourlyWeatherJson.map((data) {
      IconData icon;
      String iconString = data['icon'] ?? ''; 
      switch (iconString) {
        case 'sunny':
          icon = Icons.wb_sunny;
          break;
        case 'cloudy':
          icon = Icons.cloud;
          break;
        case 'rainy':
          icon = Icons.water;
          break;
        case 'snowy':
          icon = Icons.ac_unit;
          break;
        default:
          icon = Icons.error; 
      }
      return HourlyWeather(
        time: DateTime.parse(data['time']), 
        title: data['title'],
        description: data['description'],
        temperature: data['temperature'].toDouble(),
        icon: icon, 
      );
    }).toList();

    int id = json['id'];
    String title = json['title'];
    String description = json['description'];
    String iconUrl = json['iconUrl'];
    String city = json['city']; 

    return WeatherModel(
      id: id,
      city: city,
      title: title,
      description: description,
      iconUrl: iconUrl,
      hourlyWeather: hourlyWeatherList,
    );
  }

  Map<String, dynamic> toJson() {
    List<dynamic> hourlyWeatherJson = hourlyWeather?.map((hourlyWeather) => {
          'time': hourlyWeather.time.toIso8601String(), 
          'title': hourlyWeather.title,
          'description': hourlyWeather.description,
          'temperature': hourlyWeather.temperature,
        }).toList() ??
        [];

    return {
      'id': id,
      'date': date?.toIso8601String(), 
      'city': city, 
      'title': title,
      'description': description,
      'iconUrl': iconUrl,
      'hourlyWeather': hourlyWeatherJson, 
    };
  }
}
