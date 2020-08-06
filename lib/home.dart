import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbc_app/note_page.dart';
import './Animation/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color iconcolor = Colors.red;
  Color onpresscolorchange = Colors.white;

  // colorchange(int k) {
  //   if (k == 1) {
  //     onpresscolorchange = iconcolor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            colors: [
              Colors.green[900],
              Colors.green[800],
              Colors.green[700],
              Colors.green[600],
              Colors.green[500],
              Colors.green[400],
              Colors.green[300],
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: FadeAnimation(
                1,
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                        Colors.red[400],
                        Colors.red[500],
                        Colors.red[600],
                        Colors.red[700],
                        Colors.red[700],
                        Colors.red[600],
                        Colors.red[500],
                        Colors.red[400],
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 25,
                        offset: Offset(5, 10),
                      ),
                    ],
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
                FadeAnimation(
                  1.6,
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 300,
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.topLeft, colors: [
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
                      ]),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 25,
                          offset: Offset(5, 10),
                        ),
                      ],
                    ),
                    child: Center(
                      child: FadeAnimation(
                        1.8,
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
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    colors: [
                      Colors.teal[400],
                      Colors.teal[500],
                      Colors.teal[600],
                      Colors.teal[700],
                      Colors.teal[700],
                      Colors.teal[600],
                      Colors.teal[500],
                      Colors.teal[400],
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 25,
                      offset: Offset(5, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(
                      2,
                      MaterialButton(
                        // onLongPress: colorchange(1),
                        onPressed: () {
                          // colorchange(1);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotePage(),
                            ),
                          );
                        },
                        color: Colors.greenAccent,
                        elevation: 4,
                        splashColor: Colors.green[500],
                        highlightColor: Colors.green[900],
                        child: FadeAnimation(
                          2.2,
                          Icon(
                            Icons.assistant_photo,
                            color: iconcolor,
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
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                      2.6,
                      Text(
                        'START',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
