import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_tutorial/constants/app_colors.dart';
import 'package:weather_tutorial/constants/text_styles.dart';
import 'package:weather_tutorial/extensions/datetime.dart';

import 'package:weather_tutorial/providers/weekly_weather_provider.dart';
import 'package:weather_tutorial/widgets/subscript_text.dart';

class WeeklyForecastView extends ConsumerWidget {
  const WeeklyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyForecastView = ref.watch(weeklyWeatherProvider);
    return weeklyForecastView.when(data: (weeklyWeather) {
      return ListView.builder(itemBuilder: (context, index) {
        final dayOfWeek =
            DateTime.parse(weeklyWeather.daily.time[index]).dayOfWeek;
        final date = weeklyWeather.daily.time[index].dateTime;
        final time = weeklyWeather.daily.temperature2mMax[index].round();
        final icon = weeklyWeather.daily.weatherCode[index];

        return WeeklyWeatherTile(
          day: dayOfWeek,
          date: date,
          temp: time,
          icon: icon,
        );
      });
    }, error: (error, stackTrace) {
      return Text(error.toString());
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}

class WeeklyWeatherTile extends StatelessWidget {
  const WeeklyWeatherTile(
      {super.key,
      required this.day,
      required this.date,
      required this.temp,
      required this.icon});
  final String day;
  final String date;
  final int temp;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.accentBlue,
      ),
      child: Row(
        children: [
          Column(children: [
            Text(
              day,
              style: TextStyles.h3,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              date,
              style: TextStyles.subtitleText,
            )
          ]),
          SubscriptText(
              text: temp.toString(),
              superScript: "°C",
              color: AppColors.white,
              superScriptColor: AppColors.grey)
        ],
      ),
    );
  }
}
