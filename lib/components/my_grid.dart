import 'package:animku/components/season_title.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyGrid extends StatefulWidget {
  final List<AnimeList> animeList;
  final String judul;

  const MyGrid({Key key, this.animeList,this.judul}) : super(key: key);

  @override
  _MyGridState createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
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
                SeasonTitle(judul: widget.judul,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
                    itemCount: widget.animeList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: BaseColor.white,
                                image: DecorationImage(
                                    image: NetworkImage(widget.animeList[i].imageUrl),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 56.h,
                                width: double.infinity,
                                color: BaseColor.purpleToBlue,
                                child: Center(
                                  child: Text('${widget.animeList[i].title}',style: TextStyle(color: BaseColor.white,fontFamily: MyFonts.baloo)),
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
    );
  }
}
