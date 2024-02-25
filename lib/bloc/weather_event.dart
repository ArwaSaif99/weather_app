import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherData extends WeatherEvent {
  final String city;

  const FetchWeatherData({required this.city});

  @override
  List<Object> get props => [city];
}
