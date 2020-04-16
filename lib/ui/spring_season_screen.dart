import 'package:animku/components/my_grid_view.dart';
import 'package:animku/components/my_list.dart';
import 'package:animku/ui/currentSeason/current_season_screen.dart';
import 'package:flutter/material.dart';

class SpringSeasonScreen extends StatefulWidget {
  @override
  _SpringSeasonScreenState createState() => _SpringSeasonScreenState();
}

class _SpringSeasonScreenState extends State<SpringSeasonScreen> {
  @override
  Widget build(BuildContext context) {
    return CurrentSeasonScreen(
      title: 'Spring2020',
      mylist: MyList(),
      mygridview: MyGridView(),
    );
  }
}
