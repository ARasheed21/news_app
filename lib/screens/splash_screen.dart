import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Future.delayed(
      Duration(seconds: 3),
        (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9EEFA),
      body: Center(
        child: Text(
          "NEWS",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 64,
            color: Color(0xff2D5BD0),
          ),
        ),
      ),
    );
  }
}
