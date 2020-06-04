import 'package:animku/bloc/current_season_bloc/current_bloc_event.dart';
import 'package:animku/bloc/current_season_bloc/winter_bloc.dart';
import 'package:animku/bloc/schedule_bloc/shedule_event_state.dart';
import 'package:animku/bloc/seasonLaterBloc/season_later_bloc.dart';
import 'package:animku/components/build_error.dart';
import 'package:animku/components/build_loading.dart';
import 'package:animku/components/my_app_bar.dart';
import 'package:animku/components/my_grid.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/repository/season_later_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeasonLaterScreen extends StatefulWidget {
  @override
  _SeasonLaterScreenState createState() => _SeasonLaterScreenState();
}

class _SeasonLaterScreenState extends State<SeasonLaterScreen> {
  SeasonLaterBloc seasonLaterBloc;

  @override
  void initState() {
    super.initState();
    seasonLaterBloc = BlocProvider.of<SeasonLaterBloc>(context)..add(FetchSeasonLaterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MySecondAppBar(
      onRefresh: (){
        seasonLaterBloc = BlocProvider.of<SeasonLaterBloc>(context)..add(FetchSeasonLaterEvent());
      },
      body: Container(
        child: BlocBuilder<SeasonLaterBloc,SeasonLaterState>(
          builder: (context,state){
           if(state is SeasonLaterInitialState){
             return BuildLoading();
           } else if(state is SeasonLaterLoadedState){
             return MyGrid(
               animeList: state.animeList,
               judul: Dictionary.seasonLater,
             );
           }else if(state is SeasonLaterErrorState){
             return BuildError(errorMsg: state.message,);
           }
           return null;
          }
        ),
      ),
    );
  }
}
