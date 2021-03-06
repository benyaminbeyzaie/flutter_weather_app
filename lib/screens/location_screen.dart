import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/city_screen.dart';
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 15,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (contex) {
                        return CityScreen();
                      }));
                    },
                    child: Icon(
                      Icons.pin_drop,
                      color: Colors.white,
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
