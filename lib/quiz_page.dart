import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbc_app/Animation/FadeAnimation.dart';
import 'package:kbc_app/Animation/FadeAnimationOne.dart';
import 'package:kbc_app/resultpage.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString('assets/questions.json'),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
                child: Text(
              'Loading...',
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            )),
          );
        } else {
          return QuizPageNew(mydata: mydata);
        }
      },
    );
  }
}

// ignore: must_be_immutable
class QuizPageNew extends StatefulWidget {
  var mydata;

  QuizPageNew({Key key, @required this.mydata}) : super(key: key);
  @override
  _QuizPageNewState createState() => _QuizPageNewState(mydata);
}

class _QuizPageNewState extends State<QuizPageNew> {
  var mydata;
  Color colortoshow = Colors.blue;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  int timer = 30;
  String showtimer = "30";
  bool cancletimer = false;
  Color colortoshowtimer = Colors.white;
  Color even = Colors.white;
  Color odd = Colors.red;

  _QuizPageNewState(this.mydata);

  Map<String, Color> btncolor = {
    "a": Colors.blue,
    "b": Colors.blue,
    "c": Colors.blue,
    "d": Colors.blue
  };

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          // colortoshowtimer = Colors.white;
          nextquestion();
        } else if (cancletimer == true) {
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
    setState(() {
      if (timer < 12 && timer % 2 == 0) {
        colortoshowtimer = even;
      } else if (timer < 12) {
        colortoshowtimer = odd;
      }
    });
  }

  void nextquestion() {
    colortoshowtimer = Colors.white;
    cancletimer = false;
    timer = 30;
    setState(() {
      if (i < 10) {
        i++;
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Result(marks: marks),
          ),
        );
      }
      btncolor["a"] = Colors.blue;
      btncolor["b"] = Colors.blue;
      btncolor["c"] = Colors.blue;
      btncolor["d"] = Colors.blue;
    });
    starttimer();
  }

  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks += 10;
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
      cancletimer = true;
    });
    Timer(Duration(seconds: 2), nextquestion);
  }

  Widget choiceButton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        // child: FadeAnimation(
        // 1.4,
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
          maxLines: 1,
        ),
        // ),
        color: btncolor[k],
        elevation: 4,
        minWidth: 400,
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: FadeAnimationOne(1, Text('Opps!!!')),
            content: FadeAnimation(1, Text('You can\'n go back at this stage')),
            actions: <Widget>[
              FadeAnimation(
                1.2,
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.green,
                  elevation: 4,
                  highlightColor: Colors.green[800],
                  child: FadeAnimationOne(
                    1.2,
                    Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
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
                height: 70,
              ),
              Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    colors: [
                      Colors.red[200],
                      Colors.red[300],
                      Colors.red[500],
                      Colors.red[600],
                      Colors.red[700],
                      Colors.red[700],
                      Colors.red[600],
                      Colors.red[500],
                      Colors.red[300],
                      Colors.red[200],
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 25,
                      offset: Offset(5, 8),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FadeAnimation(
                    1,
                    Text(
                      mydata[0][i.toString()],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FadeAnimation(1.4, choiceButton("a")),
                      FadeAnimation(1.5, choiceButton("b")),
                      FadeAnimationOne(1.4, choiceButton("c")),
                      FadeAnimationOne(1.5, choiceButton("d")),
                    ],
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    colors: [
                      Colors.green[500],
                      Colors.green[600],
                      Colors.green[700],
                      Colors.green[800],
                      Colors.green[800],
                      Colors.green[700],
                      Colors.green[600],
                      Colors.green[500],
                    ],
                  ),
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 25,
                    ),
                  ],
                ),
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: FadeAnimationOne(
                    2,
                    Text(
                      showtimer,
                      style: TextStyle(
                        fontSize: 40,
                        color: colortoshowtimer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
