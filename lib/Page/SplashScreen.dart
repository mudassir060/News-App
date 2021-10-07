import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/Api/login.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.red.shade900,
          Colors.red.shade900,
        ],
      )),
      child: Stack(
        children: [
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                "assets/bbc news.jpg",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
