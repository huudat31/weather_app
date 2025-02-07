import 'package:flutter/material.dart';
import 'package:weather_tutorial/constants/app_colors.dart';
import 'package:weather_tutorial/screens/forecast_screen.dart';
import 'package:weather_tutorial/screens/search_screen.dart';
import 'package:weather_tutorial/screens/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  final _destinations = const [
    NavigationDestination(
        icon: Icon(Icons.home, color: Colors.white),
        selectedIcon: Icon(Icons.home, color: Colors.white),
        label: "Home"),
    NavigationDestination(
        icon: Icon(Icons.search_outlined, color: Colors.white),
        selectedIcon: Icon(Icons.search, color: Colors.white),
        label: "Search"),
    NavigationDestination(
      icon: Icon(Icons.wb_sunny_outlined, color: Colors.white),
      selectedIcon: Icon(Icons.wb_sunny, color: Colors.white),
      label: "Weather",
    ),
    NavigationDestination(
        icon: Icon(Icons.settings_outlined, color: Colors.white),
        selectedIcon: Icon(Icons.settings, color: Colors.white),
        label: "Settings"),
  ];
  final screens = const [
    WeatherScreen(),
    SearchScreen(),
    ForecastScreen(),
    Text("Settings"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: AppColors.secondaryBlack,
        ),
        child: NavigationBar(
          destinations: _destinations,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _currentPageIndex,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
