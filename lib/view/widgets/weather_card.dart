import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/const/colors.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/widgets/hourly_weather_list.dart';

class WeatherCard extends StatefulWidget {
  final WeatherModel weather;

  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), 
    )..repeat(reverse: true);
    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.3,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('EEEE, MMMM dd');
    final String formattedDate = dateFormat.format(widget.weather.date!);

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
            colors: [AppColors.primaryColor, Colors.white],
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
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    widget.weather.title!,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 3),
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Image.asset(
                      widget.weather.iconUrl!,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.weather.description}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              HourlyWeatherList(hourlyWeather: widget.weather.hourlyWeather),
            ],
          ),
        ),
      ),
    );
  }
}
