import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_tutorial/constants/app_colors.dart';
import 'package:weather_tutorial/constants/text_styles.dart';
import 'package:weather_tutorial/extensions/int.dart';
import 'package:weather_tutorial/providers/hourly_weather_provider.dart';
import 'package:weather_tutorial/utils/get_weather_icons.dart';

class HourlyForecastWeather extends ConsumerWidget {
  const HourlyForecastWeather({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyWeatherData = ref.watch(hourlyWeatherProvider);
    return hourlyWeatherData.when(
        data: (hourlyWeather) {
          return SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hourlyWeather.cnt,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final weather = hourlyWeather.list[index];
                return HourlyWeatherTile(
                  id: weather.weather[0].id,
                  hour: weather.dt.time,
                  temp: weather.main.temp.round(),
                  isActive: index == 0,
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Center(child: const CircularProgressIndicator()));
  }
}

class HourlyWeatherTile extends StatelessWidget {
  const HourlyWeatherTile(
      {super.key,
      required this.id,
      required this.hour,
      required this.temp,
      required this.isActive});
  final int id;
  final String hour;
  final int temp;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, right: 16.0, bottom: 12.0),
      child: Material(
          color: isActive ? AppColors.lightBlue : AppColors.accentBlue,
          borderRadius: BorderRadius.circular(15.0),
          elevation: isActive ? 8 : 0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image.asset(getWeatherIcon(weatherCode: id)),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    hour,
                    style: TextStyles.subtitleText,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${temp} °C',
                    style: TextStyles.h3,
                  )
                ],
              )
            ]),
          )),
    );
  }
}
