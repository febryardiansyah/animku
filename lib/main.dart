import 'package:animku/bloc/current_season_bloc/fall_bloc.dart';
import 'package:animku/bloc/current_season_bloc/spring_bloc.dart';
import 'package:animku/bloc/current_season_bloc/summer_bloc.dart';
import 'package:animku/bloc/current_season_bloc/winter_bloc.dart';
import 'package:animku/bloc/schedule_bloc/friday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/monday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/saturday_bloc.dart';

import 'package:animku/bloc/schedule_bloc/sunday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/thursday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/tuesday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/wednesday_bloc.dart';
import 'package:animku/bloc/simple_bloc_delegate.dart';

import 'package:animku/repository/current_season_repo.dart';
import 'package:animku/repository/detail_by_id.dart';
import 'package:animku/repository/schedule_repo.dart';
import 'package:animku/repository/search_anime_repo.dart';
import 'package:animku/repository/season_later_repo.dart';
import 'package:animku/ui/drawerList/current_season_screen.dart';
import 'package:animku/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import 'bloc/seasonLaterBloc/season_later_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => SpringBloc(CurrSeasonImp()),
        ),
        BlocProvider(
          create: (context) => WinterBloc(CurrSeasonImp()),
        ),
        BlocProvider(
          create: (context) => SummerBloc(CurrSeasonImp()),
        ),
        BlocProvider(
          create: (context) => FallBloc(CurrSeasonImp()),
        ),
        BlocProvider(
          create: (context) =>
              SeasonLaterBloc(seasonLaterRepository: SeasonLaterImplements()),
        ),
        BlocProvider(
          create: (context) => SundayBloc(ScheduleRepoImplement()),
        ),
        BlocProvider(
          create: (context) => MondayBloc(ScheduleRepoImplement()),
        ),
        BlocProvider(
          create: (context) => TuesDayBloc(ScheduleRepoImplement()),
        ),
        BlocProvider(
          create: (context) => WednesdayBloc(ScheduleRepoImplement()),
        ),
        BlocProvider(
          create: (context) => ThursdayBloc(ScheduleRepoImplement()),
        ),
        BlocProvider(
          create: (context) => FridayBloc(ScheduleRepoImplement()),
        ),
        BlocProvider(
          create: (context) => SaturdayBloc(ScheduleRepoImplement()),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchAnimeProvider(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => DetailByIdProvider(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => SplashScreen(),
          '/home': (_) => CurrentSeasonScreen(),
        },
      ),
    );
  }
}
