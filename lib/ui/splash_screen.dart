import 'dart:async';

import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _durasi = Duration(seconds: 3);
    return Timer(_durasi, navigasiPage);
  }

  void navigasiPage() {
    Navigator.pushReplacementNamed(context, '/botNavBar');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor.baseColor,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ANIMKU',
              style: TextStyle(
                  fontFamily: MyFonts.horizon,
                  fontSize: 50,
                  color: BaseColor.white),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    width: 130,
                    child: LinearProgressIndicator(
                      backgroundColor: BaseColor.purpleToBlue,
                    ))),
          ]),
    );
  }
}
