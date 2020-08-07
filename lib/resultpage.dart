import 'package:flutter/material.dart';
import 'package:kbc_app/Animation/FadeAnimation.dart';
import 'package:kbc_app/Animation/FadeAnimationOne.dart';
import 'package:kbc_app/home.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  var marks;
  Result({this.marks});

  Widget checkmarks() {
    if (marks < 40) {
      return Image.asset('assets/wrong.gif');
    } else if (marks > 40 && marks < 70) {
      return Image.asset('assets/ok.gif');
    } else {
      return Image.asset('assets/correct.gif');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            colors: [
              Colors.teal[400],
              Colors.teal[500],
              Colors.teal[600],
              Colors.teal[700],
              Colors.teal[700],
              Colors.teal[600],
              Colors.teal[500],
              Colors.teal[400],
              Colors.blue[400],
              Colors.blue[500],
              Colors.blue[600],
              Colors.blue[700],
              Colors.blue[800],
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.center,
                child: checkmarks(),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            FadeAnimation(
              1.8,
              Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 25,
                      offset: Offset(5, 10),
                    ),
                  ],
                ),
                child: FadeAnimationOne(
                  2.2,
                  Center(
                    child: Text(
                      "Congratulation your score is -> $marks",
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                        color: Colors.blueGrey[800],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        elevation: 5,
        child: FadeAnimation(
          1.4,
          FadeAnimationOne(
            1.8,
            Icon(
              Icons.home,
              size: 35,
            ),
          ),
        ),
        highlightElevation: 5,
        splashColor: Colors.blue[900],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
