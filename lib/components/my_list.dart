import 'package:animku/bloc/current_season_bloc/current_bloc_state.dart';
import 'package:animku/components/my_behavior.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/environments/my_variable.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/ui/detailscreen/details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyList extends StatefulWidget {
  final List<AnimeList> animeList;
  final seasonTitle;

  const MyList({Key key, this.animeList, this.seasonTitle,}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MyVariable.bottomBarCtrl.addListener((){
      if(MyVariable.bottomBarCtrl.offset >= MyVariable.bottomBarCtrl.position.maxScrollExtent && !MyVariable.bottomBarCtrl.position.outOfRange){
        if(mounted){
          setState(() {
            MyVariable.showFAB = true;
          });
        }
      }
      if(MyVariable.bottomBarCtrl.offset <= MyVariable.bottomBarCtrl.position.minScrollExtent && !MyVariable.bottomBarCtrl.position.outOfRange){
        if (mounted) {
          setState(() {
            MyVariable.showFAB = false;
          });
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      floatingActionButton: MyVariable.showFAB?AnimatedContainer(
        duration: Duration(seconds: 3),
        child: FloatingActionButton(
          child: Icon(Icons.keyboard_arrow_up),
          backgroundColor: BaseColor.baseColor,
          onPressed: (){
            MyVariable.bottomBarCtrl.animateTo(MyVariable.bottomBarCtrl.position.minScrollExtent, duration: Duration(
                microseconds: 1000
            ), curve: Curves.easeIn);
            },
        ),
      ):Container(),
      backgroundColor: BaseColor.baseColor,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Scrollbar(
          child: SingleChildScrollView(
            controller: MyVariable.bottomBarCtrl,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _seasonTitle(judul: widget.seasonTitle),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: widget.animeList.length,
                      itemBuilder: (context, i) {
                        List<String> genList = new List();
                        List<String> studioList = new List();
                        widget.animeList[i].genreList.forEach((v) {
                          genList.add(v.name);
                        });
                        widget.animeList[i].producers.forEach((f) {
                          studioList.add(f.name);
                        });
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              MyVariable.isList = true;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                          title: widget.animeList[i].title,
                                          imageUrl: widget.animeList[i].imageUrl,
                                          genre: genList,
                                          episodes: widget.animeList[i].episodes,
                                          score: widget.animeList[i].score,
                                          members: widget.animeList[i].members,
                                          airing: widget.animeList[i].airingStart,
                                          source: widget.animeList[i].source,
                                          studio: studioList,
                                          synopsis: widget.animeList[i].synopsis,
                                          type: widget.animeList[i].type,
                                        )));
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
      ),
    );
  }

  Widget _seasonTitle({String judul}) {
    ScreenUtil.init(context);
    return Container(
      height: 200.h,
      width: 700.w,
      color: BaseColor.greyPurple,
      child: Center(
        child: Text(
          judul,
          style: TextStyle(
              fontFamily: MyFonts.baloo, fontSize: 40, color: BaseColor.white),
        ),
      ),
    );
  }

  Widget _background({
    title,
    List<String> genre,
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
              Expanded(
                child: ListView.builder(
                  itemCount: genre.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          genre[i].toString() + ' ',
                          style:
                              TextStyle(color: Color(0xffF0F0F0), fontSize: 14),
                        ),
                      ],
                    );
                  },
                ),
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
                      '${score == null? '0':score}',
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
                    '${episodes == null?'0':episodes} eps',
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
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      imageBuilder:(context,imageProvider) => Container(
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
                DecorationImage(image: imageProvider, fit: BoxFit.cover)),
      ),
    );
  }
}
