import 'package:flutter/material.dart';
import 'package:flutter_weather_app/services/waether_condition.dart';
import 'package:flutter_weather_app/services/weather.dart';
import 'package:flutter_weather_app/utils/constants.dart';

class LocationScreen extends StatefulWidget {
  final WeatherCondition weatherCondition;
  LocationScreen(this.weatherCondition);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int tempreture;
  String cityNmae;
  int condition;
  WeatherModel model = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherCondition);
  }

  updateUI(WeatherCondition weatherCondition) {
    this.condition = weatherCondition.condition;
    this.cityNmae = weatherCondition.cityName;
    this.tempreture = weatherCondition.temperature.round() - 273;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/second_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      this.tempreture.toString() + '°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      model.getWeatherIcon(condition),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  model.getMessage(tempreture),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
