import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeasonTitle extends StatelessWidget {
  final String judul;

  const SeasonTitle({Key key, this.judul}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Container(
      height: 200.h as double,
      width: 700.w as double,
      color: BaseColor.greyPurple,
      child: Center(
        child: Text(
          judul,
          style: TextStyle(
            fontFamily: MyFonts.baloo,
            fontSize: 40,
            color: BaseColor.white,
          ),
        ),
      ),
    );
  }
}
