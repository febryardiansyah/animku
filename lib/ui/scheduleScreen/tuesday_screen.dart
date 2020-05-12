import 'package:animku/bloc/schedule_bloc/shedule_event_state.dart';
import 'package:animku/bloc/schedule_bloc/tuesday_bloc.dart';
import 'package:animku/components/build_error.dart';
import 'package:animku/components/build_loading.dart';
import 'package:animku/components/my_grid.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TuesdayScreen extends StatefulWidget {
  @override
  _TuesdayScreenState createState() => _TuesdayScreenState();
}

class _TuesdayScreenState extends State<TuesdayScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TuesDayBloc,ScheduleState>(
      builder: (context,state){
        if(state is ScheduleInitialState){
          return BuildLoading();
        }else if(state is ScheduleLoadedState){
          return MyGrid(
            animeList: state.animeList,
            judul: Dictionary.tuesday,
          );
        }else if(state is ScheduleErrorState){
          return BuildError(errorMsg: state.message,);
        }
        return null;
      },
    );
  }
}
