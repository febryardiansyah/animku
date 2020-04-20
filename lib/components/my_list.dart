import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/providers/current_season_provider.dart';
import 'package:animku/ui/detailscreen/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class MyList extends StatefulWidget {
  final thisPath;
  const MyList({Key key, this.thisPath}) : super(key: key);
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var _getData = Provider.of<CurrentSeasonProvider>(context, listen: false)
        .getCurrentSeason(widget.thisPath);
    return FutureBuilder(
        future: _getData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitWave(
              color: BaseColor.lightPurple,
            );
          }
          return Consumer<CurrentSeasonProvider>(
            builder: (context, data, _) => ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.currentSeason.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, i) {
                List genLst = new List();
                data.currentSeason[i].animeList[i].genreList.forEach((item) {
                  genLst.add(item.name);
                });
                if (i == data.currentSeason.length) {
                  return _buildProgress();
                }
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>DetailsScreen(title: data.currentSeason[i].animeList[i].title,)
                    ));
                  },
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 600.h,
                        ),
                        _background(
                          title: data.currentSeason[i].animeList[i].title,
                          genre: genLst,
                          episodes: data.currentSeason[i].animeList[i].episodes,
                          score: data.currentSeason[i].animeList[i].score,
                        ),
                        _animePic(
                            imageUrl:
                                data.currentSeason[i].animeList[i].imageUrl),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }

  Widget _buildProgress() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
}

Widget _background({
  title,
  genre,
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
