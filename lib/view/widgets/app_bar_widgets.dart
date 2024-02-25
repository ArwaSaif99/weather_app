import 'package:flutter/material.dart';
import 'package:weather_app/const/colors.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> countries;

  CustomSearchDelegate(this.countries);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.highlight_remove),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    final List<String> suggestionList = query.isEmpty
        ? countries
        : countries
            .where((country) => country.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}

AppBar buildCustomAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey, List<String> countries) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      onPressed: () {
        scaffoldKey.currentState?.openDrawer(); 
      },
    ),
    title: Text(
      'Weather App',
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
          showSearch(context: context, delegate: CustomSearchDelegate(countries));
        },
      ),
    ],
  );
}
