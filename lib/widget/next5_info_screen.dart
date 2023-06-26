import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Next5InfoScreen extends StatelessWidget {
// final DailyInfoData CurrentInfoData;
//    const Next5InfoScreen({Key? key, required this.CurrentInfoData})
//       : super(key: key);

  // string manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
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
            child: const Text(
              "Next 5 Days",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 8 > 0 //weatherDataDaily.daily.length > 7
            ? 5
            : 2, //weatherDataDaily.daily.length,
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
                        width: 80,
                        child: Text(
                          //getDay(CurrentInfoData.daily[index].dt),
                          "date",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/weather/01d.png"
                            // "assets/weather/${CurrentInfoData.daily[index].weather![0].icon}.png"
                            ),
                      ),
                      Text("no")
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
