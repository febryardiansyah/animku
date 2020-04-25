import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/ui/detailscreen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyList extends StatefulWidget {
  final List<AnimeList> animeList;
  final seasonTitle;

  const MyList({Key key, this.animeList,this.seasonTitle}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: BaseColor.baseColor,
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _seasonTitle(
                  judul: widget.seasonTitle
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: widget.animeList.length,
                    itemBuilder: (context, i) {
                      List<String> genList = new List();
                      widget.animeList[i].genreList.forEach((v){
                        genList.add(v.name);
                      });
                      return InkWell(
                        splashColor: BaseColor.transparent,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DetailsScreen(title: widget.animeList[i].title,)
                          ));
                        },
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 600.h,
                              ),
                              _background(
                                  title: widget.animeList[i].title,
                                  genre: genList,
                                  episodes: widget.animeList[i].episodes,
                                  score: widget.animeList[i].score),
                              _animePic(imageUrl: widget.animeList[i].imageUrl)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _seasonTitle({String judul}){
    ScreenUtil.init(context);
    return Container(
      height: 200.h,
      width: 700.w,
      color: BaseColor.greyPurple,
      child: Center(
        child: Text(judul,style: TextStyle(fontFamily: MyFonts.baloo,fontSize: 40,color: BaseColor.white),),
      ),
    );
  }
  Widget _background({
    title,
    List<String>genre,
    score,
    episodes,
  }) {
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
              Flexible(
                child: Text(
                  '${title}',
                  style: TextStyle(
                      fontFamily: MyFonts.baloo,
                      color: BaseColor.white,
                      fontSize: 20),
                ),
              ),
              Text(
                '${genre}',
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
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: BaseColor.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Center(
                        child: Text(
                      '${score}',
                      style: TextStyle(
                          fontFamily: MyFonts.baloo,
                          fontSize: 18,
                          color: BaseColor.orange),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.confirmation_number,
                    color: BaseColor.red,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${episodes} eps',
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

  Widget _animePic({imageUrl}) {
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
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fill)),
    );
  }
}
