import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/const/colors.dart';
Drawer buildDrawer(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Text(
            'App Settings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text('Language'),
          onTap: () {
            scaffoldKey.currentState?.openEndDrawer();
          },
        ),
        ListTile(
          title: Text('Theme'),
          onTap: () {
            scaffoldKey.currentState?.openEndDrawer();
          },
        ),
      ],
    ),
  );
}
