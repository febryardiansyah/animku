import 'package:animku/components/my_grid_view.dart';
import 'package:animku/components/my_list.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/end_point_path.dart';
import 'package:animku/providers/current_season_provider.dart';
import 'package:animku/ui/currentseason/current_season_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WinterSeasonScreen extends StatefulWidget {
  @override
  _WinterSeasonScreenState createState() => _WinterSeasonScreenState();
}

class _WinterSeasonScreenState extends State<WinterSeasonScreen> {
  @override
  Widget build(BuildContext context) {
    return CurrentSeasonScreen(
      lazyLoadingPath: EndPointPath.pathList[0],
      title: Dictionary.winter,
      mylist: MyList(
        thisPath: EndPointPath.pathList[0],
      ),
      mygridview: MyGridView(
        thisPath:EndPointPath.pathList[0],
      ),
    );
  }
}

