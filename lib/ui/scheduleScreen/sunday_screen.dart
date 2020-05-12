import 'package:animku/bloc/schedule_bloc/shedule_event_state.dart';
import 'package:animku/bloc/schedule_bloc/sunday_bloc.dart';
import 'package:animku/components/build_error.dart';
import 'package:animku/components/build_loading.dart';
import 'package:animku/components/my_grid.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SundayScreen extends StatefulWidget {
  @override
  _SundayScreenState createState() => _SundayScreenState();
}

class _SundayScreenState extends State<SundayScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SundayBloc,ScheduleState>(
      builder: (context,state){
        if(state is ScheduleInitialState){
          return BuildLoading();
        }else if(state is ScheduleLoadedState){
          return MyGrid(
            animeList: state.animeList,
            judul: Dictionary.sunday,
          );
        }else if(state is ScheduleErrorState){
          return BuildError(errorMsg: state.message,);
        }
        return null;
      },
    );
  }
}
