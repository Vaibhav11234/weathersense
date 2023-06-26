import 'dart:convert';

import 'package:get/get.dart';
import 'package:weathersense/model/current_info.dart';
import 'package:http/http.dart' as http;

import '../model/weather_data.dart';

class MyController extends GetxController {
  var isLoading = false.obs;
  // final RxString cityname = ''.obs;
  // Method to update the text field value

  // CurrentInfoData? currentInfoData;
  var currentInfoList = [].obs;

  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  //   fetchData('name');
  // }

  fetchData(String cityController) async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityController&appid=373b2c584f7216d862a88045e8704268'));
      if (response.statusCode == 200) {
        ///data successfully
        print("1");

        var result = jsonDecode(response.body);
        print(result);
        print("2");
        // weatherData = WeatherData(
        var data = CurrentInfoData.fromJson(result);
        // DailyInfoData.fromJson(result));
        currentInfoList.add(data);
        return currentInfoList;
        // );
        // CurrentInfoData.fromJson(result);
        print("3");
        // var currentInfo = CurrentInfoData.fromJson(result);
        // print("3");
        // var dailyInfo = DailyInfoData.fromJson(result);

        // weatherData.value = WeatherData(currentInfo, dailyInfo);

        // return weatherData!;
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    }
  }
}
