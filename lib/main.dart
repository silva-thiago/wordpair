import 'package:flutter/material.dart';

import './splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple[900], 
        accentColor: Colors.white, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: RandomWords(),
      home: SplashScreen(),
    );
  }
}
