import 'package:animku/components/my_grid_view.dart';
import 'package:animku/components/my_list.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/end_point_path.dart';
import 'package:animku/providers/current_season_provider.dart';
import 'package:animku/ui/currentseason/current_season_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpringSeasonScreen extends StatefulWidget {
  @override
  _SpringSeasonScreenState createState() => _SpringSeasonScreenState();
}

class _SpringSeasonScreenState extends State<SpringSeasonScreen> {
  @override
  Widget build(BuildContext context) {
    return CurrentSeasonScreen(
      lazyLoadingPath: EndPointPath.pathList[1],
      title: Dictionary.spring,
      mylist: MyList(
        thisPath: EndPointPath.pathList[1],
      ),
      mygridview: MyGridView(
        thisPath:EndPointPath.pathList[1],
      ),
    );
  }
}
