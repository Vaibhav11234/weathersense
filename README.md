# weathersense

## Description
The WeatherSense Flutter app is a user-friendly and intuitive mobile application designed to provide users with up-to-date weather information for any location they search for. With its sleek and modern design, the app allows users to easily access and view the current date, temperature, wind speed, weather conditions, and humidity of the desired location.

## Key Features
1. Search Functionality: The app includes a search bar where users can enter the name or location of their desired place. This feature enables users to quickly find weather information for any location worldwide.

2. Current Date and Time: Upon searching for a specific location, WeatherSense provides the current date and time of that particular place. This feature allows users to stay informed about the local time and easily plan their activities accordingly.

3. Temperature Display: The app displays the current temperature of the searched location. Users can quickly check whether it's hot or cold outside and make appropriate decisions regarding clothing or outdoor activities.

4. Wind Speed Information: WeatherSense provides users with the current wind speed at the searched location. This feature is particularly useful for individuals engaged in outdoor activities such as sports, hiking, or sailing, as it helps them determine wind conditions and plan accordingly.

5. Weather Conditions: The app offers a concise description of the weather conditions at the searched location. Users can easily identify whether it's sunny, cloudy, raining, snowing, or experiencing any other weather phenomenon.

6. Humidity Levels: WeatherSense also displays the current humidity level of the searched location. This information is valuable for users who are sensitive to humidity or those who want to monitor the moisture content in the air.

### 5 Days Weather Forecast
In addition to the features mentioned earlier, the WeatherSense Flutter app also offers a comprehensive 5-day forecast for the searched location. This forecast provides users with detailed information about the upcoming days, including the date, temperature, wind speed, and weather icons displayed on the app.

## Instructions on how to run app
1. Set up Flutter: First, make sure you have Flutter installed on your system. You can download Flutter from the official Flutter website (https://flutter.dev/) and follow the installation instructions for your operating system (Windows, macOS, or Linux).

2. Install dependencies: Once Flutter is installed, navigate to your project's root directory using the command line or terminal. Run the command flutter pub get to fetch and install all the dependencies required for your Flutter app. This step ensures that all the necessary packages are downloaded and ready for use.

3. Connect a device: Connect a physical device (e.g., smartphone or tablet) to your computer via USB or set up an emulator/simulator. You can use Android Studio or Xcode to set up emulators/simulators for Android or iOS respectively. Ensure that the device or emulator is properly recognized by running the command flutter devices in the terminal. It should list the available devices.

4. Run the app: In the terminal, navigate to your project's root directory and run the command flutter run. This will compile your Flutter app and launch it on the connected device or emulator. If you have multiple devices connected, you can specify the target device by running flutter run -d <device_id> where <device_id> is the ID of the desired device.

5. Observe the app: The Flutter app should now be running on the selected device or emulator. You can interact with the app and test its features. Any changes made to the code will trigger a hot reload, allowing you to see the updates in real-time without restarting the app.

Note: Before running your Flutter app, ensure that you have the necessary Flutter SDK, Dart SDK, and other related dependencies installed. Also, make sure you have a valid Flutter project set up with the necessary files and configurations.

## Working
API Integration: WeatherSense integrates with the OpenWeatherMap API to fetch weather data.

JSON Data: The API responds with weather information in JSON format.

Object Model: WeatherSense defines object models to represent the structure of the JSON response.

Data Mapping: JSON data is parsed and mapped into the corresponding object models.

Data Presentation: Extracted information is displayed in the app's UI, including current date, temperature, wind speed, weather conditions, humidity, and 5-day forecast.

Real-time Updates: The app may periodically request updated data or use real-time mechanisms to ensure the displayed information is current.

## Snapshot

  <img src="https://github.com/Vaibhav11234/weathersense/assets/80789512/d6a4ed0d-6ff4-40d5-abd2-04799b81367a" width="150" height="280">
   <img src="https://github.com/Vaibhav11234/weathersense/assets/80789512/952c633a-8008-43cb-ab80-9f35b87971eb" width="150" height="280">
     <img src="https://github.com/Vaibhav11234/weathersense/assets/80789512/255bc5fb-39cd-4737-83cd-9b9bcf0d4ece" width="150" height="280">




