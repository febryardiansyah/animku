import 'package:animku/components/bottom_navbar.dart';
import 'package:animku/providers/current_season_provider.dart';
import 'package:animku/providers/days_provider.dart';
import 'package:animku/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrentSeasonProvider()),
        ChangeNotifierProvider(
          create: (_) => DaysProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BottomNavBar(),
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
