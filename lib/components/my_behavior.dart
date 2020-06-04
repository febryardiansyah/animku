import 'package:flutter/cupertino.dart';

class MyBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    // TODO: implement getScrollPhysics
    return const ClampingScrollPhysics();
  }

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    // TODO: implement buildViewportChrome
    return child;
  }
}
