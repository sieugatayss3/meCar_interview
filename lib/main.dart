import 'package:flutter/material.dart';
import 'package:me_car_interview/configs/styles.dart';
import 'package:me_car_interview/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeCar Interview',
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: inputDecorationTheme(),
      ),
      home: BottomNavbarScreen(),
    );
  }
}
