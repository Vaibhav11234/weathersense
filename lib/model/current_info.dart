class CurrentInfoData {
  CurrentInfo currentInfo;

  static var obs;
  CurrentInfoData({required this.currentInfo});

  // factory CurrentInfoData.fromJson(Map<String, dynamic> json) =>
  //     CurrentInfoData(currentInfo: CurrentInfo.fromJson(json['currentInfo']));
  factory CurrentInfoData.fromJson(Map<String, dynamic> json) {
    return CurrentInfoData(
      currentInfo: json['currentInfo'] != null
          ? CurrentInfo.fromJson(json['currentInfo'])
          : CurrentInfo(),
    );
  }
}
// CurrentInfo CurrentInfoFromJson(String str) =>
//     CurrentInfo.fromJson(json.decode(str));

class CurrentInfo {
  String? name;
  int? temp;
  int? humidity;
  int? clouds;
  double? windSpeed;
  List<Weather>? weather;

  CurrentInfo({
    this.name,
    this.temp,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
  });

  factory CurrentInfo.fromJson(Map<String, dynamic> json) => CurrentInfo(
        name: json['name'] as String?,
        temp: (json['temp'] as num?)?.round(),
        humidity: json['humidity'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'temp': temp,
        'humidity': humidity,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
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

  Map<String, dynamic> toJson() => {
        'description': description,
        'icon': icon,
      };
}
