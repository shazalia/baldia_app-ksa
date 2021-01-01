import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:splashscreen/splashscreen.dart';

import 'AppSingIn.dart';
import 'InfractionScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new InfractionScreen(),
       image: new Image.asset(
          'assets/images/splash.png',
         fit: BoxFit.cover,
         height: double.infinity,
         width: double.infinity,
         alignment: Alignment.center,
       ),
       // imageBackground: new Image.asset("assets/images/splash.png"),
      );
  }


}
