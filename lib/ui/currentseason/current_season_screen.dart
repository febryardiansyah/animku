import 'package:animku/components/season_title.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/end_point_path.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/providers/current_season_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CurrentSeasonScreen extends StatefulWidget {
  static final ScrollController scrollController = new ScrollController();
  final title,mylist,mygridview;
  final String lazyLoadingPath;

  const CurrentSeasonScreen({Key key, this.title, this.mylist, this.mygridview,this.lazyLoadingPath}) : super(key: key);
  @override
  _CurrentSeasonScreenState createState() => _CurrentSeasonScreenState();
}

class _CurrentSeasonScreenState extends State<CurrentSeasonScreen> {
  bool isList = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CurrentSeasonScreen.scrollController.addListener((){
      if(CurrentSeasonScreen.scrollController.position.pixels == CurrentSeasonScreen.scrollController.position.maxScrollExtent){
        Provider.of<CurrentSeasonProvider>(context,listen: false).getCurrentSeason(widget.lazyLoadingPath);
      }
    });
  }
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
      body: Scrollbar(
        child: SingleChildScrollView(
          controller: CurrentSeasonScreen.scrollController,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SeasonTitle(judul: widget.title,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
                  child: isList?widget.mylist:widget.mygridview,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
