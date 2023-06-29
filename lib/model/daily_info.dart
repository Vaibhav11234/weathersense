import 'dart:convert';

DailyData dailyDataFromJson(String str) => DailyData.fromJson(json.decode(str));

// String dailyDataToJson(DailyData data) => json.encode(data.toJson());

class DailyData {
  List<ListElement> list;
  City city;
  DailyData({required this.list, required this.city});

  factory DailyData.fromJson(Map<String, dynamic> json) => DailyData(
        city: City.fromJson(json["city"]),
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );
}

class City {
  String name;

  City({
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
      );
}

class ListElement {
  int dt;
  double speed;
  int humidity;
  Temp temp;
  List<Weather> weather;

  ListElement(
      {required this.dt,
      required this.temp,
      required this.weather,
      required this.humidity,
      required this.speed});

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        humidity: json["humidity"],
        speed: json["speed"]?.toDouble(),
        dt: json["dt"],
        temp: Temp.fromJson(json["temp"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      );
}

class Temp {
  double day;

  Temp({
    required this.day,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
      };
}

class Weather {
  String main;
  String icon;

  Weather({
    required this.main,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: json["main"],
        icon: json["icon"],
      );
}
