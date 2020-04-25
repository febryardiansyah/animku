import 'package:animku/components/bottom_navbar.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppbar extends StatefulWidget {
  final Widget body;
  final Widget myList;
  final Widget myGrid;
  final onRefresh;
  bool isList;

  MyAppbar(
      {@required this.body, @required this.isList, this.myList, this.myGrid,this.onRefresh});

  @override
  _MyAppbarState createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseColor.baseColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: widget.onRefresh,
          ),
          IconButton(
            icon: widget.isList
                ? Icon(FontAwesomeIcons.gripHorizontal)
                : Icon(FontAwesomeIcons.thList),
            color: BaseColor.white,
            onPressed: () {
              if (widget.isList) {
                setState(() {
                  widget.isList = false;
                });
              } else {
                setState(() {
                  widget.isList = true;
                });
              }
            },
          )
        ],
        title: Text(
          Dictionary.appName,
          style: TextStyle(fontFamily: MyFonts.horizon, fontSize: 30),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: widget.isList ? widget.myList : widget.myGrid,
    );
  }

  Widget CustomDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Stack(children: <Widget>[
                Positioned(
                    bottom: 12.0,
                    left: 16.0,
                    child: Text("ANIMKU - Discover Your Favourite Anime",
                        style: TextStyle(
                            color: Colors.black12,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500))),
              ]))
        ],
      ),
    );
  }
}
