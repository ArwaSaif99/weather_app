import 'package:flutter/material.dart';
import 'package:weather_app/const/colors.dart';
Drawer buildDrawer(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  
  return Drawer(
    child: SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            color: AppColors.primaryColor, 
            child: Text(
              'App Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            elevation: 2, 
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              onTap: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              trailing: PopupMenuButton(
                icon: Icon(Icons.arrow_drop_down_rounded),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Text('English'),
                    value: 'English',
                  ),
                  PopupMenuItem(
                    child: Text('Arabic'),
                    value: 'Arabic',
                  ),
                ],
                onSelected: (value) {
                  print('Selected language: $value');
                },
              ),
            ),
          ),
          Card(
  elevation: 2,
  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  child: ListTile(
    leading: Icon(Icons.brightness_4),
    title: Text('Theme'),
    onTap: () {
      scaffoldKey.currentState?.openEndDrawer();
    },
    trailing: PopupMenuButton(
      icon: Icon(Icons.arrow_drop_down_rounded),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          child: Text('Light Theme'),
          value: 'light',
        ),
        PopupMenuItem(
          child: Text('Dark Theme'),
          value: 'dark',
        ),
      ],
      onSelected: (value) {
      },
    ),
  ),
),

          Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text('Units of Measurement'),
              onTap: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              trailing: PopupMenuButton(
                icon: Icon(Icons.arrow_drop_down_rounded),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Text('Celsius'),
                    value: 'Celsius',
                  ),
                  PopupMenuItem(
                    child: Text('Fahrenheit'),
                    value: 'Fahrenheit',
                  ),
                ],
                onSelected: (value) {
                  print('Selected unit: $value');
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
  
}
