import 'package:clima/models/weather.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final snackBar = const SnackBar(
    content: Text("City doesn't exist"),
  );
  String cityName = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/city_background.jpg"),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 14.0, top: 50.0, right: 14.0, bottom: 14.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              onChanged: (value) {
                cityName = value;
              },
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: "Enter City Name",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            InkWell(
                onTap: () async {
                  final weatherData =
                      await WeatherModel().getCityWeatherData(cityName);

                  if (weatherData == null) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LocationScreen(weatherData: weatherData)));
                },
                child: const Text(
                  "Get Weather",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    ));
  }
}
