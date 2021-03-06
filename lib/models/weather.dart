import 'package:clima/models/location.dart';
import 'package:clima/services/network.dart';

const baseURL = "https://api.openweathermap.org/data/2.5/weather";
const apiKey = "API_KEY";

class WeatherModel {
  Future<dynamic> getWeatherData() async {
    try {
      Location location = Location();
      await location.getLocation();
      Network network = Network();
      final weatherData = await network.getLocationWeatherData(
          "$baseURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
      return weatherData;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> getCityWeatherData(String cityName) async {
    try {
      Location location = Location();
      await location.getLocation();
      Network network = Network();
      final weatherData = await network.getLocationWeatherData(
          "$baseURL?q=$cityName&appid=$apiKey&units=metric");
      return weatherData;
    } catch (e) {
      return null;
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
