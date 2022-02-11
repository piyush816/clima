import 'package:clima/models/weather.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    final weather = WeatherModel();

    final weatherData = await weather.getWeatherData();

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  weatherData: weatherData,
                )));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
