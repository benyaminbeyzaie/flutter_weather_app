import 'package:flutter/material.dart';
import 'package:flutter_weather_app/services/networking.dart';
import 'package:flutter_weather_app/utils/constants.dart';
import 'package:flutter_weather_app/services/weather.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String _cityName;
  String _showableCityName = '';
  int _temp = 0;
  int cityTemp = 0;
  void findCityTemp(String cityNameURL) async {
    print(cityNameURL);
    NetworkHelper networkHelper = NetworkHelper(cityNameURL);
    WeatherCondition condition = await networkHelper.getData();
    updateUI(condition);
  }

  void updateUI(WeatherCondition condition) {
    setState(() {
      _temp = condition.temperature.round() - 273;
      _showableCityName = condition.cityName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/first_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 40.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: TextField(
                    onChanged: (value) {
                      _cityName = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'City name',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _showableCityName,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  _temp.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'IRANSans',
                    color: Colors.white,
                  ),
                ),
              ),
              MaterialButton(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                onPressed: () {
                  findCityTemp(
                      'http://api.openweathermap.org/data/2.5/weather?q=$_cityName&appid=$apiKey');
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
