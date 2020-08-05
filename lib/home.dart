import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbc_app/quiz_page.dart';
import './Animation/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          gradient: LinearGradient(begin: Alignment.topLeft, colors: [
            Colors.green[900],
            Colors.green[600],
            Colors.green[300],
          ]),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: FadeAnimation(
                1,
                Container(
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.red[700],
                      Colors.red[400],
                      Colors.red[300],
                    ]),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: FadeAnimation(
                    1.6,
                    Text(
                      'Are You Ready !!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.green[100],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topRight, colors: [
                    Colors.yellow[900],
                    Colors.yellow[700],
                    Colors.yellow[500],
                  ]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(
                      1.8,
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizPage(),
                            ),
                          );
                        },
                        color: Colors.green[700],
                        elevation: 4,
                        splashColor: Colors.green[500],
                        highlightColor: Colors.green[900],
                        child: FadeAnimation(
                          2,
                          Icon(
                            Icons.assistant_photo,
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
