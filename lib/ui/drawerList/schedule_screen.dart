import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:animku/bloc/schedule_bloc/friday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/monday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/saturday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/shedule_event_state.dart';
import 'package:animku/bloc/schedule_bloc/sunday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/thursday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/tuesday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/wednesday_bloc.dart';
import 'package:animku/components/my_drawer.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/ui/scheduleScreen/friday_screen.dart';
import 'package:animku/ui/scheduleScreen/monday_screen.dart';
import 'package:animku/ui/scheduleScreen/saturday_screen.dart';
import 'package:animku/ui/scheduleScreen/sunday_screen.dart';
import 'package:animku/ui/scheduleScreen/thursday_screen.dart';
import 'package:animku/ui/scheduleScreen/tuesday_screen.dart';
import 'package:animku/ui/scheduleScreen/wednesday_screen.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  TabController tabController;

  String currentDay = DateFormat('EEEEEE').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    BlocProvider.of<SundayBloc>(context).add(FetchSchedule());
    BlocProvider.of<MondayBloc>(context).add(FetchSchedule());
    BlocProvider.of<TuesDayBloc>(context).add(FetchSchedule());
    Future.delayed(
      const Duration(seconds: 3),
      () {
        BlocProvider.of<WednesdayBloc>(context).add(FetchSchedule());
        BlocProvider.of<ThursdayBloc>(context).add(FetchSchedule());
        Future.delayed(
          const Duration(seconds: 2),
          () {
            BlocProvider.of<FridayBloc>(context).add(FetchSchedule());
            BlocProvider.of<SaturdayBloc>(context).add(FetchSchedule());
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      initialIndex: currentDayFn(),
      child: Scaffold(
        backgroundColor: BaseColor.baseColor,
        appBar: AppBar(
          title: Text(
            Dictionary.appName,
            style: TextStyle(
              fontFamily: MyFonts.horizon,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: BaseColor.baseColor,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => initialize(),
            )
          ],
          bottom: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.white,
            isScrollable: true,
            labelColor: BaseColor.white,
            indicatorColor: BaseColor.white,
            indicator: BoxDecoration(
              gradient: LinearGradient(
                  colors: [BaseColor.purpleToBlue, BaseColor.greyPurple]),
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent,
            ),
            tabs: [
              Tab(
                text: Dictionary.sunday,
              ),
              Tab(text: Dictionary.monday),
              Tab(text: Dictionary.tuesday),
              Tab(text: Dictionary.wednesday),
              Tab(text: Dictionary.thursday),
              Tab(text: Dictionary.friday),
              Tab(text: Dictionary.saturday),
            ],
          ),
        ),
        drawer: const MyDrawer(),
        body: TabBarView(
          children: [
            SundayScreen(),
            MondayScreen(),
            TuesdayScreen(),
            WednesdayScreen(),
            ThursdayScreen(),
            FridayScreen(),
            SaturdayScreen(),
          ],
        ),
      ),
    );
  }

  int currentDayFn() {
    switch (currentDay) {
      case 'Sunday':
        return 0;
        break;
      case 'Monday':
        return 1;
        break;
      case 'Tuesday':
        return 2;
        break;
      case 'Wednesday':
        return 3;
        break;
      case 'Thursday':
        return 4;
        break;
      case 'Friday':
        return 5;
        break;
      case 'Saturday':
        return 6;
        break;
      default:
        return null;
        break;
    }
  }
}
