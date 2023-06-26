import 'dart:convert';

import 'model/current_info.dart';
import 'model/daily_info.dart';
import 'model/weather_data.dart';
import 'package:http/http.dart' as http;

class FetchApi {
  WeatherData? weatherData;
}
