import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_weather_app/services/waether_condition.dart';

class NetworkHelper {
  final String _url;
  NetworkHelper(this._url);
  Future<WeatherCondition> getData() async {
    http.Response response = await http.get(_url);
    if (response.statusCode == 200) {
      String data = response.body;
      Map<String, dynamic> dataMap = jsonDecode(data);
      WeatherCondition weatherCondition = WeatherCondition.fromJson(dataMap);
      return weatherCondition;
    } else {
      print(response.statusCode);
    }
  }
}
