import 'package:equatable/equatable.dart';
import 'package:weather_app/model/weather_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<WeatherModel> weathers;

  const WeatherLoaded({required this.weathers});

  @override
  List<Object?> get props => [weathers];
}

class WeatherError extends WeatherState {
  final String message;

  const WeatherError({required this.message});

  @override
  List<Object?> get props => [message];
}
