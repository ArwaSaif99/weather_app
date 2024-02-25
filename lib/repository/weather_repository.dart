import 'package:weather_app/data/dummy_weather_data.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherRepository {
  List<WeatherModel> fetchDummyWeatherData() {
    return dummyWeatherData;
  }
}
