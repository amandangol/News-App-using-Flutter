import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news_api_/views/home_screen.dart';

import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        this.context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                "assets/images/news.png",
                height: 150,
                width: 150,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "We show the News for You",
                style:
                    GoogleFonts.lato(fontSize: 40, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 2,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 40),
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  "Skip",
                  style: GoogleFonts.lato(
                      fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
