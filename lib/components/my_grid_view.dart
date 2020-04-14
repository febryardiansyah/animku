import 'package:animku/environments/colors.dart';
import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      physics:ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisSpacing: 8,
      mainAxisSpacing: 15,
      children: <Widget>[
        Container(color: BaseColor.white,),
        Container(color: BaseColor.white,),
        Container(color: BaseColor.white,),
        Container(color: BaseColor.white,),
        Container(color: BaseColor.white,),
        Container(color: BaseColor.white,),
      ],
    );
  }
}
