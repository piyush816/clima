import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  Future getLocationWeatherData(url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Something went wrong status code ${response.statusCode}");
    }
  }
}
