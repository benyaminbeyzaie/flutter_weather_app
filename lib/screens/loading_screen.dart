import 'package:flutter/material.dart';
import 'package:flutter_weather_app/services/location.dart';
import 'package:flutter_weather_app/services/networking.dart';
import 'package:flutter_weather_app/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app/screens/location_screen.dart';

const apiKey = 'd1da19ec8119361ce85b80bd0087c282';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=' +
            location.latitude.round().toString() +
            '&lon=' +
            location.longitude.round().toString() +
            '&appid=$apiKey');
    WeatherCondition weatherCondition = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (contex) {
      return LocationScreen(weatherCondition);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
