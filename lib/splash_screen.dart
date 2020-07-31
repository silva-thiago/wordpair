import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shimmer/shimmer.dart';

import './random_words.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToHome();
      } else {
        _navigateToHome(); // Implementar tela de login
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => RandomWords()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(decoration: BoxDecoration(color: Colors.deepPurple[600])),
        Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /* CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Icon(Icons.list,
                      color: Colors.purpleAccent[400], size: 50.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ), */
                  Text(
                    'WordPair Generator', style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]
              )
            )
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /* CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 20.0)
                ), */
                  Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.deepPurpleAccent,
                    child: Text('Choose your words', 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                )
              ],
            ),
          ),
        ])
      ]),
    );
  }
}