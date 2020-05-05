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
    WinterScreen(),
    SpringScreen(),
    SummerScreen(),
    FallScreen()
  ];
  bool bottomBarVisible = true;

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
    // TODO: implement initState
    super.initState();
    MyVariable.bottomBarCtrl.addListener(_bottomScrollListener);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds:500),
        height: bottomBarVisible?60:0,
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
