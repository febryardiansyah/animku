import 'package:animku/bloc/schedule_bloc/friday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/monday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/saturday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/shedule_event_state.dart';
import 'package:animku/bloc/schedule_bloc/sunday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/thursday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/tuesday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/wednesday_bloc.dart';
import 'package:animku/components/my_app_bar.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/ui/scheduleScreen/friday_screen.dart';
import 'package:animku/ui/scheduleScreen/monday_screen.dart';
import 'package:animku/ui/scheduleScreen/saturday_screen.dart';
import 'package:animku/ui/scheduleScreen/sunday_screen.dart';
import 'package:animku/ui/scheduleScreen/thursday_screen.dart';
import 'package:animku/ui/scheduleScreen/tuesday_screen.dart';
import 'package:animku/ui/scheduleScreen/wednesday_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  TabController tabController;

  var currentDay = DateFormat('EEEEEE').format(DateTime.now());

  SundayBloc sundayBloc;
  MondayBloc mondayBloc;
  TuesDayBloc tuesDayBloc;
  WednesdayBloc wednesdayBloc;
  ThursdayBloc thursdayBloc;
  FridayBloc fridayBloc;
  SaturdayBloc saturdayBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(currentDay);
    sundayBloc = BlocProvider.of<SundayBloc>(context);
    sundayBloc.add(FetchSchedule());
    mondayBloc = BlocProvider.of<MondayBloc>(context);
    mondayBloc.add(FetchSchedule());
    tuesDayBloc = BlocProvider.of<TuesDayBloc>(context);
    tuesDayBloc.add(FetchSchedule());
    Future.delayed(Duration(seconds: 3),(){
      wednesdayBloc = BlocProvider.of<WednesdayBloc>(context);
      wednesdayBloc.add(FetchSchedule());
      thursdayBloc = BlocProvider.of<ThursdayBloc>(context);
      thursdayBloc.add(FetchSchedule());
      fridayBloc = BlocProvider.of(context);
      fridayBloc.add(FetchSchedule());
      Future.delayed(Duration(seconds: 2),(){
        saturdayBloc = BlocProvider.of<SaturdayBloc>(context);
        saturdayBloc.add(FetchSchedule());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MySecondAppBar(
      onRefresh: () {},
      body: ListView(children: [
        DefaultTabController(
            length: 7,
            initialIndex: currentDayFn(),
            child: Column(
              children: [
                Material(
                  color: BaseColor.baseColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBar(
                      controller: tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Colors.white,
                      isScrollable: true,
                      labelColor: BaseColor.white,
                      indicatorColor: BaseColor.white,
                      indicator: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            BaseColor.purpleToBlue,
                            BaseColor.greyPurple
                          ]),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.redAccent),
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
                ),
                SingleChildScrollView(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.only(bottom: 140),
                      child: TabBarView(
                        children: [
                          SundayScreen(),
                          MondayScreen(),
                          TuesdayScreen(),
                          WednesdayScreen(),
                          ThursdayScreen(),
                          FridayScreen(),
                          SaturdayScreen(),
                        ],
                      )),
                )
              ],
            ))
      ]),
    );
  }
  currentDayFn() {
    switch(currentDay){
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
