import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathersense/screen/5day_forecast_screen.dart';
import '../model/daily_info.dart';
import 'current_info_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  DailyData? dailyData;
  String date = DateFormat("yMMMMd").format(DateTime.now());

  fetchData(String cityController) async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityController&appid=373b2c584f7216d862a88045e8704268'));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
      } else {
        print('Request failed with status code ${response.statusCode}');
      }
      http.Response response5 = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast/daily?q=$cityController&units=metric&cnt=8&appid=373b2c584f7216d862a88045e8704268'));
      if (response5.statusCode == 200) {
        var result5 = jsonDecode(response5.body);
        // Check the JSON response
        // print(result5['list'][17]['dt_txt']);
        setState(() {
          dailyData = DailyData.fromJson(result5);
        });
      } else {
        print('Request failed with status code ${response5.statusCode}');
      }
    } catch (e) {
      print('Error while getting data: $e');
    }
  }

  // final MyController controller = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();
    // MyController myController = MyController();
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Container(
              child: TextField(
                controller: cityController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(242, 242, 254, 1),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 242, 254, 1),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffeceff5)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.only(left: 15),
                    // border: InputBorder.none,
                    hintText: 'Weather in your city'),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(),
              child: IconButton(
                  iconSize: 40,
                  padding: EdgeInsets.only(right: 30),
                  icon: Icon(Icons.search),
                  onPressed: () {
                    fetchData(cityController.text);
                  }),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CurrentInfoScreen(
                  date: date,
                  dailyData: dailyData,
                ),
                SizedBox(
                  height: 20,
                ),
                DayForecastScreen(dailyData: dailyData),
              ],
            ),
          ),
        ));
  }
}
