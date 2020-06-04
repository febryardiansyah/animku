import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  @override
  void afterFirstLayout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
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
              color: BaseColor.white,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 130,
              child: LinearProgressIndicator(
                backgroundColor: BaseColor.purpleToBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
