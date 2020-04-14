import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyList extends StatefulWidget {
  final String image, title, genre, score, type;

  const MyList(
      {Key key, this.image, this.title, this.genre, this.score, this.type})
      : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: 600.h,
              ),
              _background(),
              _animePic(),
            ],
          ),
        )
      ],
    );
  }

  Widget _background() {
    return Positioned(
      top: 25.h,
      child: Container(
        alignment: Alignment.center,
        height: 500.h,
        width: 1000.w,
        decoration: BoxDecoration(
            color: BaseColor.lightPurple,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.only(left: 380.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Anime Name',
                style: TextStyle(
                    fontFamily: MyFonts.baloo,
                    color: BaseColor.white,
                    fontSize: 25),
              ),
              Text(
                'comedy, romance',
                style: TextStyle(color: Color(0xffF0F0F0), fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: BaseColor.orange,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: BaseColor.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Center(
                        child: Text(
                      '9.1',
                      style: TextStyle(
                          fontFamily: MyFonts.baloo,
                          fontSize: 18,
                          color: BaseColor.orange),
                    )),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.tv,
                    color: BaseColor.red,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'TV',
                    style: TextStyle(
                        fontFamily: MyFonts.baloo,
                        fontSize: 18,
                        color: BaseColor.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _animePic() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 320.w,
      height: 540.h,
      decoration: BoxDecoration(
        color: BaseColor.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 5),
            color: Colors.black12,
          ),
          BoxShadow(offset: Offset(-5, -5), color: Colors.black12)
        ],
//        image: DecorationImage(
//          image: AssetImage(widget.image),fit: BoxFit.fill
//        )
      ),
    );
  }
}
