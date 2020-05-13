import 'package:animku/bloc/schedule_bloc/saturday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/shedule_event_state.dart';
import 'package:animku/components/build_error.dart';
import 'package:animku/components/build_loading.dart';
import 'package:animku/components/my_grid.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaturdayScreen extends StatefulWidget {
  @override
  _SaturdayScreenState createState() => _SaturdayScreenState();
}

class _SaturdayScreenState extends State<SaturdayScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaturdayBloc,ScheduleState>(
      builder: (context,state){
        if(state is ScheduleInitialState){
          return BuildLoading();
        }else if(state is ScheduleLoadedState){
          return MyGrid(
            animeList: state.animeList,
            judul: Dictionary.saturday,
          );
        }else if(state is ScheduleErrorState){
          return BuildError(errorMsg: state.message,);
        }
        return null;
      },
    );
  }
}
