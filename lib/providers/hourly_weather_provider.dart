import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_tutorial/services/api_helper.dart';

final hourlyWeatherProvider = FutureProvider.autoDispose((ref) async {
  return await ApiHelper.getHourlyForecast();
});
