import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeEvent { light, dark }

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(_buildLightTheme());

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    yield event == ThemeEvent.light ? _buildLightTheme() : _buildDarkTheme();
  }

  static ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
     // accentColor: Colors.deepOrange,
      primaryColor: Colors.cyanAccent,
    );
  }

  static ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
   //   accentColor: Colors.lightBlueAccent,
      primaryColor: Colors.pink,
    );
  }
}
