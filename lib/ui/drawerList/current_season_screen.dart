import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:animku/bloc/current_season_bloc/current_bloc_event.dart';
import 'package:animku/bloc/current_season_bloc/fall_bloc.dart';
import 'package:animku/bloc/current_season_bloc/spring_bloc.dart';
import 'package:animku/bloc/current_season_bloc/summer_bloc.dart';
import 'package:animku/bloc/current_season_bloc/winter_bloc.dart';
import 'package:animku/components/bottom_navbar.dart';

class CurrentSeasonScreen extends StatefulWidget {
  @override
  _CurrentSeasonScreenState createState() => _CurrentSeasonScreenState();
}

class _CurrentSeasonScreenState extends State<CurrentSeasonScreen> {
  FallBloc fallBloc;
  SpringBloc springBloc;
  SummerBloc summerBloc;
  WinterBloc winterBloc;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavBar();
  }

  Future<void> init() async {
    winterBloc = BlocProvider.of<WinterBloc>(context)..add(FetchCurrentEvent());
    springBloc = BlocProvider.of<SpringBloc>(context)..add(FetchCurrentEvent());
    summerBloc = BlocProvider.of<SummerBloc>(context)..add(FetchCurrentEvent());
    fallBloc = BlocProvider.of<FallBloc>(context)..add(FetchCurrentEvent());
  }
}
