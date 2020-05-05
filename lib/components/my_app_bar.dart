import 'package:animku/components/bottom_navbar.dart';
import 'package:animku/components/my_drawer.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppbar extends StatefulWidget {
  final Widget myList;
  final Widget myGrid;
  final onRefresh;
  bool isList;

  MyAppbar({@required this.isList, this.myList, this.myGrid, this.onRefresh});

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
      drawer: MyDrawer(),
      body: widget.isList ? widget.myList : widget.myGrid,
    );
  }
}

class MySecondAppBar extends StatefulWidget {
  final Widget body;
  final onRefresh;

  const MySecondAppBar({Key key, this.body,this.onRefresh,}) : super(key: key);

  @override
  _MySecondAppBarState createState() => _MySecondAppBarState();
}

class _MySecondAppBarState extends State<MySecondAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseColor.baseColor,
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: widget.onRefresh,
          ),
        ],
        title: Text(
          Dictionary.appName,
          style: TextStyle(fontFamily: MyFonts.horizon, fontSize: 30),
        ),
      ),
      drawer: MyDrawer(),
      body:widget.body ,
    );
  }
}
