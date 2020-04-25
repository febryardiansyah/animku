import 'package:animku/bloc/current_season_bloc/current_bloc_event.dart';
import 'package:animku/bloc/current_season_bloc/fall_bloc.dart';
import 'package:animku/bloc/current_season_bloc/spring_bloc.dart';
import 'package:animku/bloc/current_season_bloc/summer_bloc.dart';
import 'package:animku/bloc/current_season_bloc/winter_bloc.dart';
import 'package:animku/components/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentSeasonScreen extends StatefulWidget {
  @override
  _CurrentSeasonScreenState createState() => _CurrentSeasonScreenState();
}

class _CurrentSeasonScreenState extends State<CurrentSeasonScreen> {
  @override
  Widget build(BuildContext context) {
    return BottomNavBar();
  }
}
