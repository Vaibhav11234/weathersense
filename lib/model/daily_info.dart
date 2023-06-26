class DailyInfoData {
  List<DailyInfo> daily;
  DailyInfoData({required this.daily});

  factory DailyInfoData.fromJson(Map<String, dynamic> json) => DailyInfoData(
      daily: List<DailyInfo>.from(
          json['daily'].map((e) => DailyInfo.fromJson(e))));
}

class DailyInfo {
  int? dt;
  Temp? temp;

  List<Weather>? weather;

  DailyInfo({
    this.dt,
    this.temp,
    this.weather,
  });

  factory DailyInfo.fromJson(Map<String, dynamic> json) => DailyInfo(
        dt: json['dt'] as int?,
        temp: json['temp'] == null
            ? null
            : Temp.fromJson(json['temp'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class Temp {
  double? day;

  Temp({this.day});

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: (json['day'] as num?)?.toDouble(),
      );
}

class Weather {
  String? description;
  String? icon;

  Weather({this.description, this.icon});

  // from json
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );
}
