import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/end_point_path.dart';
import 'package:animku/providers/current_season_provider.dart';
import 'package:animku/providers/days_provider.dart';
import 'package:animku/ui/spring_season_screen.dart';
import 'package:animku/ui/currentSeason/current_season_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List<Widget>_children = [
    SpringSeasonScreen(),
    SpringSeasonScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CurrentSeasonProvider>(context,listen: false).getWinter();
    Provider.of<DaysProvider>(context,listen: false).getDays();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: onTapTapped,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        items: [
          _customItems(
            icon: Icon(Icons.ac_unit),
            title: Dictionary.winter
          ),
          _customItems(
              icon: Icon(FontAwesomeIcons.leaf),
              title: Dictionary.spring
          ),
          _customItems(
            icon: Icon(Icons.wb_sunny),
            title: Dictionary.summer
          ),
          _customItems(
            icon: Icon(LineAwesomeIcons.leaf),
            title: Dictionary.fall
          )
        ],
      ),
    );
  }
  void onTapTapped(index){
    setState(() {
      currentIndex = index;
    });
  }
  _customItems({icon,title,active,inactive}){
    return BottomNavyBarItem(
      title: Text(title),
      icon: icon,
      activeColor: BaseColor.greyPurple,
      inactiveColor: BaseColor.grey,
    );
  }
}
