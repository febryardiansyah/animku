import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/models/search_model_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondDetail extends StatefulWidget {
  final SearchList searchList;

  const SecondDetail({Key key, this.searchList}) : super(key: key);

  @override
  _SecondDetailState createState() => _SecondDetailState();
}

class _SecondDetailState extends State<SecondDetail> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            decoration: BoxDecoration(
              color: BaseColor.baseColor,
              image: DecorationImage(
                image: NetworkImage(widget.searchList.imageUrl),
                fit: BoxFit.cover
              ),
            ),
          ),
          backButton(),
          _whitelayer(),
          ImagePic(),
          title(),
          _genre(),
        ],
      ),
    );
  }
  Widget backButton(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: RaisedButton(
        elevation: 8,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        child: Icon(Icons.arrow_back_ios,color: BaseColor.white,),
        color: BaseColor.baseColor,
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
  Widget _whitelayer(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 450,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: BaseColor.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(-10,-10),
              blurRadius: 8
            ),
          ]
        ),
      ),
    );
  }
  Widget ImagePic(){
    ScreenUtil.init(context);
    return Positioned(
      left: 70.w,
      top: 500.h,
      child: Container(
        height: 180,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(10,10),
              color: Colors.black26,
              blurRadius: 8
            ),
            BoxShadow(
              offset: Offset(-10,-10),
              color: Colors.black26,
              blurRadius: 8
            )
          ],
          image: DecorationImage(
            image: NetworkImage(widget.searchList.imageUrl),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
  Widget title(){
    return Positioned(
      top: 700.h,
      left: 470.w,
      child: Container(
        height: 100,
        width: 210,
        child: Center(
          child: Text(widget.searchList.title,textAlign: TextAlign.left,
          style: TextStyle(fontFamily: MyFonts.baloo,
          fontSize: widget.searchList.title.length >= 20?20:30),),
        ),
      ),
    );
  }
  Widget _genre(){
    ScreenUtil.init(context);
    return Positioned(
      top: 1000.h,
      child: Container(
        height: 100.h,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.searchList.genreList.length,
            itemBuilder: (context,i){
              return Card(
                color: BaseColor.greyPurple,
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                    child: Text(widget.searchList.genreList[i].name+' ',
                style: TextStyle(color: BaseColor.white,fontFamily: MyFonts.baloo),)),
              );
            },
          ),
        ),
      ),
    );
  }
}
