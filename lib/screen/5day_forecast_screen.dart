import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weathersense/model/daily_info.dart';

// ignore: must_be_immutable
class DayForecastScreen extends StatelessWidget {
  DayForecastScreen({super.key, required this.dailyData});
  DailyData? dailyData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 350,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 242, 254, 1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            //margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Next 5 Days",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          dailyList(context, dailyData),
        ],
      ),
    );
  }

  String getDay(final day) {
    if (day == null) {
      return 'days';
    }
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('MMM,d').format(time);
    return x;
  }

  Widget dailyList(BuildContext context, DailyData? dailyData) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5, //weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 60,
                        child: Text(
                          //getDay(CurrentInfoData.daily[index].dt),
                          (getDay(dailyData?.list[index + 1].dt)).toString() ??
                              "default",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13),
                        ),
                      ),
                      Text(
                        (dailyData?.list[index].temp.day.toStringAsFixed(2) ??
                                '21') +
                            "°",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: width / 15,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                            "assets/weather/${(dailyData?.list[index].weather[0].icon) ?? '09d'}.png"
                            // "assets/weather/${CurrentInfoData.daily[index].weather![0].icon}.png"
                            ),
                      ),
                      Text((dailyData?.list[index].weather[0].main).toString())
                    ],
                  )),
              Container(
                height: 1,
                color: Colors.black26,
              )
            ],
          );
        },
      ),
    );
  }
}
