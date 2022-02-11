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
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
