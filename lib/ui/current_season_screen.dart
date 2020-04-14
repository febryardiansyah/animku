import 'package:animku/components/my_grid_view.dart';
import 'package:animku/components/my_list.dart';
import 'package:animku/components/season_title.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurrentSeasonScreen extends StatefulWidget {
  @override
  _CurrentSeasonScreenState createState() => _CurrentSeasonScreenState();
}

class _CurrentSeasonScreenState extends State<CurrentSeasonScreen> {
  bool isList = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor.baseColor,
      appBar: AppBar(
        backgroundColor: BaseColor.baseColor,
        actions: <Widget>[
          IconButton(
            icon: isList?Icon(FontAwesomeIcons.gripHorizontal):Icon(FontAwesomeIcons.thList),
            color: BaseColor.white,
            onPressed: (){
              if(isList){
                setState(() {
                  isList = false;
                });
              }else{
               setState(() {
                 isList = true;
               });
              }
            },
          )
        ],
        title: Text(Dictionary.appName,style: TextStyle(fontFamily: MyFonts.horizon,fontSize: 30),),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SeasonTitle(judul: 'Winter 2020',),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
              child: isList?MyList():MyGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
