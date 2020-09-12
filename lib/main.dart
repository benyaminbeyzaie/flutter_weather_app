import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/city_screen.dart';
import 'package:flutter_weather_app/screens/loading_screen.dart';
import 'package:flutter_weather_app/screens/location_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoadingScreen(),
    );
  }
}
