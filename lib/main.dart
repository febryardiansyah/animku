import 'package:animku/bloc/current_season_bloc/fall_bloc.dart';
import 'package:animku/bloc/current_season_bloc/spring_bloc.dart';
import 'package:animku/bloc/current_season_bloc/summer_bloc.dart';
import 'package:animku/bloc/current_season_bloc/winter_bloc.dart';
import 'package:animku/components/bottom_navbar.dart';
import 'package:animku/repository/current_season_repo.dart';
import 'package:animku/ui/drawerList/current_season_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SpringBloc(CurrSeasonImp()),
        ),
        BlocProvider(
          create: (context) =>
              WinterBloc(CurrSeasonImp()),
        ),
        BlocProvider(
          create: (context) => SummerBloc(CurrSeasonImp()),
        ),
        BlocProvider(
          create: (context) => FallBloc(CurrSeasonImp()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: CurrentSeasonScreen(),
        ),
//        initialRoute: '/',
//        routes: {
//          '/':(_) => SplashScreen(),
//          '/botNavBar':(_) => BottomNavBar(),
//        },
      ),
    );
  }
}
