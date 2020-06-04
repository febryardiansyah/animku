import 'package:animku/components/my_drawer.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppbar extends StatefulWidget {
  final Widget myList;
  final Widget myGrid;
  final VoidCallback onRefresh;
  final bool isList;

  const MyAppbar({
    @required this.isList,
    this.myList,
    this.myGrid,
    this.onRefresh,
  });

  @override
  _MyAppbarState createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  bool isList;

  @override
  void initState() {
    super.initState();
    isList = widget.isList;
  }

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
            icon: isList
                ? Icon(FontAwesomeIcons.gripHorizontal)
                : Icon(FontAwesomeIcons.thList),
            color: BaseColor.white,
            onPressed: () {
              if (isList) {
                setState(() {
                  isList = false;
                });
              } else {
                setState(() {
                  isList = true;
                });
              }
            },
          )
        ],
        title: Text(
          Dictionary.appName,
          style: TextStyle(
            fontFamily: MyFonts.horizon,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: isList ? widget.myList : widget.myGrid,
    );
  }
}

class MySecondAppBar extends StatefulWidget {
  final Widget body;
  final VoidCallback onRefresh;

  const MySecondAppBar({
    Key key,
    this.body,
    this.onRefresh,
  }) : super(key: key);

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
      drawer: const MyDrawer(),
      body: widget.body,
    );
  }
}
