import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_tutorial/constants/text_styles.dart';
import 'package:weather_tutorial/extensions/datetime.dart';
import 'package:weather_tutorial/providers/current_weather_provider.dart';
import 'package:weather_tutorial/views/gradient_container.dart';
import 'package:weather_tutorial/views/hourly_forecast_weather.dart';
import 'package:weather_tutorial/views/weather_info.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);

    return weatherData.when(
        data: (weather) => GradientContainer(children: [
              SizedBox(
                width: double.infinity,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weather.name,
                    style: TextStyles.h1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    DateTime.now().dateTime,
                    style: TextStyles.subtitleText,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 260,
                    child: Image.asset(
                        'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png'),
                  ),
                  const SizedBox(height: 40),
                  Text(weather.weather[0].main, style: TextStyles.h3),
                  const SizedBox(height: 40),
                ],
              ),
              WeatherInfo(
                weather: weather,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today', style: TextStyles.h2),
                  TextButton(
                      onPressed: () {},
                      child: Text('View full forecast',
                          style: TextStyles.subtitleText))
                ],
              ),
              const SizedBox(height: 40),
              HourlyForecastWeather()
            ]),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () {
          return const Center(child: CircularProgressIndicator());
        });
  }
}
