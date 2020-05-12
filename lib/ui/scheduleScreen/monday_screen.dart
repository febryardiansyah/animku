import 'package:animku/bloc/schedule_bloc/monday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/shedule_event_state.dart';
import 'package:animku/components/build_error.dart';
import 'package:animku/components/build_loading.dart';
import 'package:animku/components/my_grid.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MondayScreen extends StatefulWidget {
  @override
  _MondayScreenState createState() => _MondayScreenState();
}

class _MondayScreenState extends State<MondayScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MondayBloc,ScheduleState>(
      builder: (context,state){
        if(state is ScheduleInitialState){
          return BuildLoading();
        }else if(state is ScheduleLoadedState){
          return MyGrid(
            judul: Dictionary.monday,
            animeList: state.animeList,
          );
        }else if(state is ScheduleErrorState){
          return BuildError(errorMsg: state.message,);
        }
        return null;
      },
    );
  }
}
