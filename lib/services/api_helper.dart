import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show immutable;
import '/constants/constants.dart';
import '/models/hourly_weather.dart';
import '/models/weather.dart';
import '/models/weekly_weather.dart';
import '/services/geolocator.dart';
import '/utils/logging.dart';

@immutable
class ApiHelper {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const weeklyWeatherUrl =
      "https://api.open-meteo.com/v1/forecast?hourly=temperature_2m";

  static double lon = 105.8542;
  static double lat = 21.0285;
  static final dio = Dio();

  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  static Future<Weather> getCurrentWeather() async {
    await fetchLocation();
    final url = _constructWeatherUrl();
    final response = await fetchData(url);
    return Weather.fromJson(response);
  }

  static Future<HourlyWeather> getHourlyForecast() async {
    await fetchLocation();
    final url = _constructForecastUrl();
    final response = await fetchData(url);
    return HourlyWeather.fromJson(response);
  }

  static Future<WeeklyWeather> getWeeklyForecast() async {
    await fetchLocation();
    final url = _constructWeeklyWeatherUrl();
    final response = await fetchData(url);
    return WeeklyWeather.fromJson(response);
  }

  static Future<Weather> getWeatherByCityName(
      {required String cityName}) async {
    final url = _constructWeatherByCityUrl(cityName);
    final response = await fetchData(url);
    return Weather.fromJson(response);
  }

  static String _constructWeatherUrl() =>
      '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';
  static String _constructForecastUrl() =>
      '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';
  static String _constructWeatherByCityUrl(String cityName) =>
      '$baseUrl/weather?q=$cityName&appid=${Constants.apiKey}';
  static String _constructWeeklyWeatherUrl() =>
      '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';

  static Future<Map<String, dynamic>> fetchData(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200 && response.data != null) {
        return response.data as Map<String, dynamic>;
      } else {
        printWarning("Failed to load data: ${response.statusCode}");
      }
    } catch (e, stacktrace) {
      printError("Error fetching data: $e");
      printError("Stacktrace: $stacktrace");
    }
    return {}; // Trả về một map rỗng để tránh lỗi null
  }
}
