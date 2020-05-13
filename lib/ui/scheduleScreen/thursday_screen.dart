import 'package:animku/bloc/schedule_bloc/shedule_event_state.dart';
import 'package:animku/bloc/schedule_bloc/thursday_bloc.dart';
import 'package:animku/components/build_error.dart';
import 'package:animku/components/build_loading.dart';
import 'package:animku/components/my_grid.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThursdayScreen extends StatefulWidget {
  @override
  _ThursdayScreenState createState() => _ThursdayScreenState();
}

class _ThursdayScreenState extends State<ThursdayScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThursdayBloc,ScheduleState>(
      builder: (context,state){
        if(state is ScheduleInitialState){
          return BuildLoading();
        }else if(state is ScheduleLoadedState){
          return MyGrid(
            animeList: state.animeList,
            judul: Dictionary.thursday,
          );
        }else if(state is ScheduleErrorState){
          return BuildError(errorMsg: state.message,);
        }
        return null;
      },
    );
  }
}
