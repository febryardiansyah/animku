import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:animku/components/my_behavior.dart';
import 'package:animku/components/season_title.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/environments/my_variable.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/ui/detailscreen/second_detail.dart';

class MyGrid extends StatefulWidget {
  final List<AnimeList> animeList;
  final String judul;
  final Widget searchBar;

  const MyGrid({
    Key key,
    this.animeList,
    this.judul,
    this.searchBar,
  }) : super(key: key);

  @override
  _MyGridState createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MyVariable.bottomBarCtrl.addListener(
      () {
        if (MyVariable.bottomBarCtrl.offset >=
                MyVariable.bottomBarCtrl.position.maxScrollExtent &&
            !MyVariable.bottomBarCtrl.position.outOfRange) {
          if (mounted) {
            setState(() {
              MyVariable.showFAB = true;
            });
          }
        }
        if (MyVariable.bottomBarCtrl.offset <=
                MyVariable.bottomBarCtrl.position.minScrollExtent &&
            !MyVariable.bottomBarCtrl.position.outOfRange) {
          if (mounted) {
            setState(() {
              MyVariable.showFAB = false;
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: BaseColor.baseColor,
      floatingActionButton: MyVariable.showFAB
          ? FloatingActionButton(
              onPressed: () {
                MyVariable.bottomBarCtrl.animateTo(
                  MyVariable.bottomBarCtrl.position.minScrollExtent,
                  duration: const Duration(microseconds: 1000),
                  curve: Curves.easeIn,
                );
              },
              backgroundColor: BaseColor.baseColor,
              child: Icon(Icons.keyboard_arrow_up),
            )
          : Container(),
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
                  SeasonTitle(
                    judul: widget.judul,
                  ),
                  Container(child: widget.searchBar),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: widget.animeList.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
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
                        return ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                MyVariable.isList = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondDetail(
                                    malId: widget.animeList[i].malId,
                                  ),
                                ),
                              );
                            },
                            child: CachedNetworkImage(
                              imageUrl: widget.animeList[i].imageUrl,
                              placeholder: (context, loading) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, error, _) =>
                                  Icon(Icons.error),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  color: BaseColor.white,
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 56.h as double,
                                    width: double.infinity,
                                    color: BaseColor.purpleToBlue,
                                    child: Center(
                                      child: Text(
                                        widget.animeList[i].title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: BaseColor.white,
                                          fontFamily: MyFonts.baloo,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
}
