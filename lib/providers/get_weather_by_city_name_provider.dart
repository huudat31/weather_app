import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_tutorial/models/weather.dart';
import 'package:weather_tutorial/services/api_helper.dart';

final getWeatherByCityNameProvider =
    FutureProvider.autoDispose.family<Weather, String>(
  (ref, String cityName) => ApiHelper.getWeatherByCityName(
    cityName: cityName,
  ),
);
