import 'package:flutter/material.dart';
import 'package:weather_tutorial/constants/text_styles.dart';
import 'package:weather_tutorial/models/weather.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weather});
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherInfoTile(
            title: 'Temp',
            value: '${weather.main.temp} °C',
          ),
          WeatherInfoTile(title: 'Wind', value: '${weather.wind.speed} m/s'),
          WeatherInfoTile(
              title: 'Humidity', value: '${weather.main.humidity}%'),
        ],
      ),
    );
  }
}

class WeatherInfoTile extends StatelessWidget {
  const WeatherInfoTile({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyles.subtitleText,
        ),
        Text(
          value,
          style: TextStyles.h3,
        ),
      ],
    );
  }
}
