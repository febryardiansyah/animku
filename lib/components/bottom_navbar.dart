import 'package:animku/bloc/current_season_bloc/current_bloc_event.dart';
import 'package:animku/bloc/current_season_bloc/spring_bloc.dart';
import 'package:animku/bloc/current_season_bloc/winter_bloc.dart';
import 'package:animku/components/my_app_bar.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/end_point_path.dart';
import 'package:animku/environments/my_variable.dart';
import 'package:animku/repository/current_season_repo.dart';
import 'package:animku/ui/currentScreen/fall_screen.dart';
import 'package:animku/ui/currentScreen/spring_screen.dart';
import 'package:animku/ui/currentScreen/summer_screen.dart';
import 'package:animku/ui/currentScreen/winter_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  List<Widget>_children = [
    WinterScreen(),
    SpringScreen(),
    SummerScreen(),
    FallScreen()
  ];
  bool bottomBarVisible = true;
  String formatDate = DateFormat.MMM().format(DateTime.now());

  _bottomScrollListener(){
    if(MyVariable.bottomBarCtrl.position.userScrollDirection == ScrollDirection.reverse){
      if(mounted){
        setState(() {
          bottomBarVisible = false;
        });
      }
    }
    if(MyVariable.bottomBarCtrl.position.userScrollDirection == ScrollDirection.forward){
      if(mounted){
        setState(() {
          bottomBarVisible = true;
        });
      }
    }
  }
  @override
  void initState() {
    super.initState();
    print(formatDate);
    checkSeasonIndex();
    MyVariable.bottomBarCtrl.addListener(_bottomScrollListener);
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds:500),
        height: bottomBarVisible?150.h:0,
        child: !bottomBarVisible?Container():BottomNavyBar(
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
      ),
    );
  }

  int checkSeasonIndex(){
    if(formatDate.contains('Mar') || formatDate.contains('Apr') || formatDate.contains('May')){
      return currentIndex = 1;
    }else if(formatDate.contains('Jun') || formatDate.contains('Jul') || formatDate.contains('Aug')){
      return currentIndex = 2;
    }else if(formatDate.contains('Sep') || formatDate.contains('Oct') || formatDate.contains('Nov')){
      return currentIndex = 3;
    }else{
      return currentIndex = 0;
    }
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
