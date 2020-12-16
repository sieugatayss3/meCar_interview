import 'package:flutter/material.dart';
import 'package:me_car_interview/core/utils.dart';
import 'package:me_car_interview/screens/screens.dart';

import 'home_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  @override
  _BottomNavbarScreenState createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  final List _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    UserScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => _currentIndex = index),
          selectedItemColor: Colors.white,
          backgroundColor: Colors.white,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            Icons.home,
            Icons.search,
            Icons.add,
            Icons.messenger_outline,
            Icons.account_circle_outlined
          ]
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      width: 70,
                      height: 40,
                      // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: _currentIndex == key
                            ? LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                    HexColor('FF00D6'),
                                    HexColor('FF4D00')
                                  ])
                            : null,
                      ),
                      child: Icon(value),
                    ),
                  ),
                ),
              )
              .values
              .toList()),
    );
  }
}
