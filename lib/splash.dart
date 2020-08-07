import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kbc_app/Animation/FadeAnimation.dart';
import 'package:kbc_app/Animation/FadeAnimationOne.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplasScreenState createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            colors: [
              Colors.cyan[200],
              Colors.cyan[300],
              Colors.cyan[600],
              Colors.cyan[700],
              Colors.lightGreen[700],
              Colors.lightGreen[600],
              Colors.lightGreen[400],
              Colors.lightGreen[300],
            ],
          ),
        ),
        child: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeAnimation(
                1.5,
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      colors: [
                        Colors.red[200],
                        Colors.red[300],
                        Colors.red[500],
                        Colors.red[600],
                        Colors.red[600],
                        Colors.red[500],
                        Colors.red[300],
                        Colors.red[200],
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey[800],
                        blurRadius: 25,
                        offset: Offset(7, 12),
                      ),
                    ],
                  ),
                  child: FadeAnimationOne(
                    2,
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
