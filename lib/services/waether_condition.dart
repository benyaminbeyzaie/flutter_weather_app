import 'dart:convert';
class WeatherCondition {
  final double temperature;
  final int condition;
  final String cityName;

  WeatherCondition(this.temperature, this.condition, this.cityName);

  WeatherCondition.fromJson(Map<String, dynamic> json)
      : temperature = json['main']['temp'],
        condition = json['weather'][0]['id'],
        cityName = json['name'];
}
