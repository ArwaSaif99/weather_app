import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/repository/weather_repository.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherData>(_onFetchWeatherData);
  }

  Future<void> _onFetchWeatherData(
      FetchWeatherData event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final List<WeatherModel> weathers = await WeatherRepository().fetchDummyWeatherData();
      emit(WeatherLoaded(weathers: weathers));
    } catch (e) {
      emit(const WeatherError(message: 'Failed to load Weathers'));
    }
  }
}
