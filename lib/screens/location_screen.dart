import 'package:clima/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/models/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, required this.weatherData}) : super(key: key);

  final weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  int tempratue = 0;
  String weatherIcon = "";
  String message = "";

  void updateUI(dynamic weatherdata) {
    double temp = weatherdata["main"]["temp"];
    tempratue = temp.toInt();

    final condition = weatherdata["weather"][0]["id"];
    weatherIcon = weather.getWeatherIcon(condition);

    final cityName = weatherdata["name"];
    message = "${weather.getMessage(tempratue)} in $cityName";

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/location_background.jpg"),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 14.0, top: 50.0, right: 14.0, bottom: 14.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    final weatherData = await weather.getWeatherData();
                    updateUI(weatherData);
                  },
                  child: const Icon(
                    Icons.navigation,
                    size: 40.0,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                  child: const Icon(
                    Icons.location_city,
                    size: 40.0,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Text(
                        "$tempratue°",
                        style: const TextStyle(
                            fontSize: 100.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        weatherIcon,
                        style: const TextStyle(
                          fontSize: 72.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}


//  Container(
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
//       child: