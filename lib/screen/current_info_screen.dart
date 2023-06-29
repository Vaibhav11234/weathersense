import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weathersense/model/daily_info.dart';

class CurrentInfoScreen extends StatelessWidget {
  final String date;

  DailyData? dailyData;
  CurrentInfoScreen({
    super.key,
    required this.dailyData,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              dailyData?.city.name ?? "cityName",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Colors.black38),
            ),
            Text(date),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/weather/${(dailyData?.list[0].weather[0].icon) ?? '09d'}.png",
              // ${weatherDataCurrent.current.weather![0].icon}
              height: height * 0.1,
              width: width * 0.3,
            ),
            Text(
              (dailyData?.list[0].temp.day.toStringAsFixed(2) ?? '21') + "°",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: width / 10,
                color: Colors.black38,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(242, 242, 254, 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(242, 242, 254, 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/weather.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(242, 242, 254, 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/humidity.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                ((dailyData?.list[0].speed) ?? 6.6).toStringAsFixed(2) + "km/h",
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                // "${weatherDataCurrent.current.clouds}%",
                dailyData?.list[0].weather[0].main ?? "clody",
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                (dailyData?.list[0].humidity).toString() ?? "humidity",
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            )
          ],
        )
      ]),
    );
  }
}
