import 'dart:async';

import 'package:flutter/material.dart';
import 'package:headlines/allnews.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   late Timer _timer;
  @override
  void initState() {
    _timer = Timer(Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => AllNews()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  
  children: [
 
      Image(image: AssetImage('assets/Screenshot (47).png')),

  ],
)
    );
  }
}