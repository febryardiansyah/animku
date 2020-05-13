import 'package:animku/bloc/schedule_bloc/shedule_event_state.dart';
import 'package:animku/bloc/schedule_bloc/wednesday_bloc.dart';
import 'package:animku/components/build_error.dart';
import 'package:animku/components/build_loading.dart';
import 'package:animku/components/my_grid.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WednesdayScreen extends StatefulWidget {
  @override
  _WednesdayScreenState createState() => _WednesdayScreenState();
}

class _WednesdayScreenState extends State<WednesdayScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WednesdayBloc,ScheduleState>(
      builder: (context,state){
        if(state is ScheduleInitialState){
          return BuildLoading();
        }else if(state is ScheduleLoadedState){
          return MyGrid(
            animeList: state.animeList,
            judul: Dictionary.wednesday,
          );
        }else if(state is ScheduleErrorState){
          return BuildError(errorMsg: state.message,);
        }
        return null;
      },
    );
  }
}
