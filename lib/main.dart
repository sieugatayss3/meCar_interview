import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:me_car_interview/configs/styles.dart';
import 'package:me_car_interview/provider/auth_provider.dart';
import 'package:me_car_interview/provider/images_provider.dart';
import 'package:me_car_interview/screens/screens.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthService.instance()),
      ChangeNotifierProvider(create: (_) => ImagesServive()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeCar Interview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: inputDecorationTheme(),
      ),
      home: _showScreen(context),
    );
  }
}

Widget _showScreen(BuildContext context) {
  switch (context.watch<AuthService>().appState) {
    case AppState.authenticating:
    case AppState.unauthenticated:
      return LogoutScreen();
    case AppState.initial:
      return LogoutScreen();
    case AppState.authenticated:
      return BottomNavbarScreen();
  }
  return Container();
}
