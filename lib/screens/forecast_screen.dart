import 'package:flutter/material.dart';
import 'package:weather_tutorial/constants/text_styles.dart';
import 'package:weather_tutorial/extensions/datetime.dart';
import 'package:weather_tutorial/views/gradient_container.dart';
import 'package:weather_tutorial/views/hourly_forecast_weather.dart';
import 'package:weather_tutorial/views/weekly_forecast_view.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(children: [
        const SizedBox(height: 10),
        Center(
          child: Text(
            'Forecast Repor',
            style: TextStyles.h1,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Today', style: TextStyles.h2),
          Text(DateTime.now().dateTime, style: TextStyles.subtitleText)
        ]),
        const SizedBox(
          height: 20,
        ),
        const HourlyForecastWeather(),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Next Forecast', style: TextStyles.h2),
            Icon(Icons.calendar_month_outlined, color: Colors.white)
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const WeeklyForecastView(),
      ]),
    );
  }
}
