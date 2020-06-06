import 'package:animku/environments/colors.dart';
import 'package:flutter/material.dart';

class BuildError extends StatelessWidget {
  final String errorMsg;

  const BuildError({
    Key key,
    this.errorMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor.baseColor,
      body: Center(
        child: Text(errorMsg),
      ),
    );
  }
}
