import 'package:flutter/material.dart';
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
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: checkmarks(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                "Congratulation your score is $marks",
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
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
        child: Icon(
          Icons.home,
          size: 35,
        ),
        highlightElevation: 5,
        splashColor: Colors.blue[900],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
