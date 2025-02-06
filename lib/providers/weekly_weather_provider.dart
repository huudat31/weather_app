import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_tutorial/services/api_helper.dart';

final weeklyWeatherProvider = FutureProvider.autoDispose((ref) async {
  return await ApiHelper.getWeeklyForecast();
});
