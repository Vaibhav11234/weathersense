import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathersense/fetch_api.dart';
import 'package:weathersense/widget/next5_info_screen.dart';

import '../controller/my_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MyController controller = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();
    MyController myController = MyController();
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Container(
              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              // alignment: Alignment.centerLeft,
              // color: Color.fromRGBO(242, 242, 254, 1),
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
                    myController.fetchData(cityController.text);
                  }),
            ),
          ],
          // leading: IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {},
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CurrentInfoScreen(context, controller),
                SizedBox(
                  height: 20,
                ),
                Next5InfoScreen(),
              ],
            ),
          ),
        ));
  }
}

Widget CurrentInfoScreen(BuildContext context, MyController controller) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() {
            return Text(
              '${controller.currentInfoList![0].currentInfo.name}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Colors.black38),
            );
          }),
          Text('bn'),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            "assets/weather/01d.png",
            // ${weatherDataCurrent.current.weather![0].icon}
            height: height * 0.1,
            width: width * 0.3,
          ),
          Text(
            "41°",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 68,
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
              "50km/h",
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              // "${weatherDataCurrent.current.clouds}%",
              "cloudy",
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "20%",
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          )
        ],
      )
    ]),
  );
}
