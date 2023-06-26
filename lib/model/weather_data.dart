import 'package:weathersense/model/current_info.dart';
import 'package:weathersense/model/daily_info.dart';

class WeatherData {
  final CurrentInfoData? currentInfo;
  // final DailyInfoData? dailyInfo;

  WeatherData([this.currentInfo
      //  this.dailyInfo
      ]);

  // function to fetch these values
  CurrentInfoData? getCurrentInfo() => currentInfo;

  // DailyInfoData? getDailyInfo() => dailyInfo;
}
