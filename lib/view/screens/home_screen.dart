import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/const/colors.dart';
import 'package:weather_app/view/widgets/app_bar_widgets.dart';
import 'package:weather_app/view/widgets/drawer_widget.dart';
import 'package:weather_app/view/widgets/error_indicator.dart';
import 'package:weather_app/view/widgets/loading_indicator.dart';
import 'package:weather_app/view/widgets/weather_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedCity = "New York";
    context.read<WeatherBloc>().add(FetchWeatherData(city: selectedCity));
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return Scaffold(
      key: scaffoldKey,
      appBar: buildCustomAppBar(context, scaffoldKey), 
      drawer: buildDrawer(context, scaffoldKey), 
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const LoadingIndicator();
          } else if (state is WeatherLoaded) {
            return ListView.builder(
              itemCount: state.weathers.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(
                      'Dubai, United Arab Emirates',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  );
                }
                return WeatherCard(weather: state.weathers[index - 1]);
              },
            );
          } else if (state is WeatherError) {
            return ErrorIndicator(message: state.message);
          } else {
            return const Center(
              child: Text('No data'),
            );
          }
        },
      ),
    );
  }

 

}