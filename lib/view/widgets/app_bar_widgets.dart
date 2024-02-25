import 'package:flutter/material.dart';
import 'package:weather_app/const/colors.dart';

AppBar buildCustomAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {
          scaffoldKey.currentState?.openDrawer(); // Use the scaffoldKey to open the drawer
        },
      ),
      title: Text(
        'Weather Forecast',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          letterSpacing: 1.5,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            // Handle search functionality
          },
        ),
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {
            // Handle notifications functionality
          },
        ),
      ],
    );
  
}
