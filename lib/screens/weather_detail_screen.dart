import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_tutorial/constants/text_styles.dart';
import 'package:weather_tutorial/extensions/datetime.dart';
import 'package:weather_tutorial/providers/get_weather_by_city_name_provider.dart';
import 'package:weather_tutorial/views/gradient_container.dart';
import 'package:weather_tutorial/views/weather_info.dart';

class WeatherDetailScreen extends ConsumerWidget {
  const WeatherDetailScreen({super.key, required this.cityName});
  final String cityName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(getWeatherByCityNameProvider(cityName));
    return weatherData.when(
        data: (weather) {
          return Scaffold(
            body: GradientContainer(children: [
              SizedBox(
                width: double.infinity,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
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
                    height: 50,
                  ),
                  SizedBox(
                    height: 280,
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
            ]),
          );
        },
        error: (error, stackTrance) => Text(error.toString()),
        loading: () {
          return const Center(child: CircularProgressIndicator());
        });
  }
}
