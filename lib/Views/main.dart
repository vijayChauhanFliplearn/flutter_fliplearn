import 'package:flutter/material.dart';
import 'package:flutter_fliplearn/Views/login.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/LoginScreen': (BuildContext context) => new LoginScreen()
    },
    theme: new ThemeData(
      primaryColor: Colors.deepPurple,
    ),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/LoginScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Image.asset(
                'drawablehdpi/ic_page_logo.png',
                height: 50.0,
                // fit: BoxFit.cover,
              ),
            ),
            new Container(
                child: new Text(
              'Personalised Smart Learning',
              style: TextStyle(color: Colors.white),
            )),
          ],
        ),
      ),
    );
  }
}
