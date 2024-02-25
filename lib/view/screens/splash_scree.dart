import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/const/colors.dart';
import 'package:weather_app/view/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => WeatherBloc(),
          child: HomeScreen(),
        )),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: constraints.maxWidth * 0.6, 
                height: constraints.maxWidth * 0.6, 
              ),
              CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
