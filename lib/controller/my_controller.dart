// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:weathersense/model/current_info.dart';
// import 'package:http/http.dart' as http;

// import '../model/weather_data.dart';

// class MyController extends GetxController {
//   var isLoading = false.obs;
//   // final RxString cityname = ''.obs;
//   // Method to update the text field value

//   // CurrentInfoData? currentInfoData;
//   var currentInfoList;

//   // @override
//   // Future<void> onInit() async {
//   //   super.onInit();
//   //   fetchData('name');
//   // }

//   fetchData(String cityController) async {
//     try {
//       http.Response response = await http.get(Uri.parse(
//           'https://api.openweathermap.org/data/2.5/weather?q=$cityController&appid=373b2c584f7216d862a88045e8704268'));
//       if (response.statusCode == 200) {
//         var result = jsonDecode(response.body);
//         print(result); // Check the JSON response

//         if (result != null && result is Map<String, dynamic>) {
//           CurrentInfoData data = CurrentInfoData.fromJson(result);
//           print(data); // Verify the parsed data
//           return data;
//         } else {
//           print('Invalid JSON data');
//         }
//       } else {
//         print('Request failed with status code ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error while getting data: $e');
//     }
//   }
// }
