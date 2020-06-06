import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:animku/components/my_behavior.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/environments/my_variable.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/ui/detailscreen/second_detail.dart';

class MyList extends StatefulWidget {
  final List<AnimeList> animeList;
  final String seasonTitle;

  const MyList({
    Key key,
    this.animeList,
    this.seasonTitle,
  }) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  void initState() {
    super.initState();
    MyVariable.bottomBarCtrl.addListener(
      () {
        if (MyVariable.bottomBarCtrl.offset >=
                MyVariable.bottomBarCtrl.position.maxScrollExtent &&
            !MyVariable.bottomBarCtrl.position.outOfRange) {
          if (mounted) {
            setState(
              () {
                MyVariable.showFAB = true;
              },
            );
          }
        }
        if (MyVariable.bottomBarCtrl.offset <=
                MyVariable.bottomBarCtrl.position.minScrollExtent &&
            !MyVariable.bottomBarCtrl.position.outOfRange) {
          if (mounted) {
            setState(
              () {
                MyVariable.showFAB = false;
              },
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      floatingActionButton: MyVariable.showFAB
          ? AnimatedContainer(
              duration: const Duration(seconds: 3),
              child: FloatingActionButton(
                backgroundColor: BaseColor.baseColor,
                onPressed: () {
                  MyVariable.bottomBarCtrl.animateTo(
                    MyVariable.bottomBarCtrl.position.minScrollExtent,
                    duration: const Duration(microseconds: 1000),
                    curve: Curves.easeIn,
                  );
                },
                child: Icon(Icons.keyboard_arrow_up),
              ),
            )
          : Container(),
      backgroundColor: BaseColor.baseColor,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Scrollbar(
          child: SingleChildScrollView(
            controller: MyVariable.bottomBarCtrl,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _seasonTitle(judul: widget.seasonTitle),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: widget.animeList.length,
                      itemBuilder: (context, i) {
                        final List<String> genList = <String>[];
                        final List<String> studioList = <String>[];
                        for (final GenreList genre
                            in widget.animeList[i].genreList) {
                          genList.add(genre.name);
                        }
                        for (final Producers producer
                            in widget.animeList[i].producers) {
                          studioList.add(producer.name);
                        }
                        return GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                MyVariable.isList = true;
                              },
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecondDetail(
                                  malId: widget.animeList[i].malId,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: <Widget>[
                              Container(height: 600.h as double),
                              _background(
                                  title: widget.animeList[i].title,
                                  genre: genList,
                                  episodes: widget.animeList[i].episodes,
                                  score: widget.animeList[i].score),
                              _animePic(imageUrl: widget.animeList[i].imageUrl)
                            ],
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

  Widget _background({
    String title,
    List<String> genre,
    double score,
    int episodes,
  }) {
    return Positioned(
      top: 25.h as double,
      child: Container(
        alignment: Alignment.center,
        height: 500.h as double,
        width: 1000.w as double,
        decoration: BoxDecoration(
          color: BaseColor.lightPurple,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 380.w as double),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Text(
                  title.length >= 15 ? '${title.substring(0, 15)}..' : title,
                  style: TextStyle(
                    fontFamily: MyFonts.baloo,
                    color: BaseColor.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: genre.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${genre[i].toString()} ',
                          style: const TextStyle(
                            color: Color(0xffF0F0F0),
                            fontSize: 14,
                          ),
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
                  const SizedBox(width: 10),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: BaseColor.white,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Center(
                      child: Text(
                        '${score ?? 0}',
                        style: TextStyle(
                          fontFamily: MyFonts.baloo,
                          fontSize: 18,
                          color: BaseColor.orange,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.confirmation_number,
                    color: BaseColor.red,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${episodes ?? 0} eps',
                    style: TextStyle(
                      fontFamily: MyFonts.baloo,
                      fontSize: 18,
                      color: BaseColor.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _animePic({String imageUrl}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      imageBuilder: (context, imageProvider) => Container(
        margin: const EdgeInsets.only(left: 10),
        width: 320.w as double,
        height: 540.h as double,
        decoration: BoxDecoration(
          color: BaseColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 5),
              color: Colors.black12,
            ),
            BoxShadow(offset: const Offset(-5, -5), color: Colors.black12)
          ],
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
