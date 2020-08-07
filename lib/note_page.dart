import 'package:flutter/material.dart';
import 'package:kbc_app/Animation/FadeAnimation.dart';
import 'dart:async';

import 'package:kbc_app/quiz_page.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  String showtimer = '10';
  int timer = 10;
  Color colortoshow = Colors.white;
  Color even = Colors.white;
  Color odd = Colors.red;

  void settimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
        } else {
          colorchange();

          timer -= 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void colorchange() {
    if (timer < 7 && timer % 2 == 0) {
      colortoshow = odd;
    } else if (timer < 7) {
      colortoshow = even;
    }
  }

  @override
  void initState() {
    settimer();
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => QuizPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Colors.cyan[200],
              Colors.cyan[300],
              Colors.cyan[600],
              Colors.cyan[700],
              Colors.cyan[700],
              Colors.lightGreen[700],
              Colors.lightGreen[600],
              Colors.lightGreen[400],
              Colors.lightGreen[300],
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 100,
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey[900],
                    blurRadius: 25,
                    offset: Offset(5, 10),
                  ),
                ],
              ),
              child: Center(
                child: FadeAnimation(
                  1,
                  Text(
                    '[NOTE: You\'ve 10 questions & \neach question has 30 sec time & \nevery question has 10 marks]',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  colors: [
                    Colors.blue[400],
                    Colors.blue[500],
                    Colors.blue[600],
                    Colors.blue[700],
                    Colors.blue[800],
                    Colors.blue[800],
                    Colors.blue[700],
                    Colors.blue[600],
                    Colors.blue[500],
                    Colors.blue[400],
                  ],
                ),
                borderRadius: BorderRadius.circular(80),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Center(
                child: FadeAnimation(
                  1.4,
                  Text(
                    showtimer,
                    style: TextStyle(
                      fontSize: 70,
                      color: colortoshow,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
