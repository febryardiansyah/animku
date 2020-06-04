import 'package:animku/environments/colors.dart';
import 'package:flutter/material.dart';

class BuildLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor.baseColor,
      body: LinearProgressIndicator(
        backgroundColor: BaseColor.purpleToBlue,
      ),
    );
  }
}
