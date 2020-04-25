import 'package:animku/bloc/current_season_bloc/current_bloc_event.dart';
import 'package:animku/bloc/current_season_bloc/current_bloc_state.dart';
import 'package:animku/bloc/current_season_bloc/fall_bloc.dart';
import 'package:animku/bloc/current_season_bloc/spring_bloc.dart';
import 'package:animku/components/build_error.dart';
import 'package:animku/components/build_loading.dart';
import 'package:animku/components/my_app_bar.dart';
import 'package:animku/components/my_grid.dart';
import 'package:animku/components/my_list.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/my_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FallScreen extends StatefulWidget {
  @override
  _FallScreenState createState() => _FallScreenState();
}

class _FallScreenState extends State<FallScreen> {
  FallBloc fallBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fallBloc = BlocProvider.of<FallBloc>(context);
    fallBloc.add(FetchCurrentEvent());
  }
  @override
  Widget build(BuildContext context) {
    return MyAppbar(
      onRefresh: (){
        fallBloc.add(FetchCurrentEvent());
      },
      isList: MyVariable.isList,
      myList: Container(
        child: BlocBuilder<FallBloc, CurrentBlocState>(
          builder: (context, state) {
            if (state is CurrentInitialState) {
              return BuildLoading();
            } else if (state is CurrentLoadingState) {
              return BuildLoading();
            } else if (state is CurrentLoadedState) {
              return MyList(
                animeList: state.animeList,
                seasonTitle: Dictionary.fall2020,
              );
            } else if (state is CurrentErrorState) {
              return BuildError(
                errorMsg: state.message,
              );
            }
            return null;
          },
        ),
      ),
      myGrid: BlocBuilder<FallBloc, CurrentBlocState>(
        builder: (context, state) {
          if (state is CurrentInitialState) {
            return BuildLoading();
          } else if (state is CurrentLoadingState) {
            return BuildLoading();
          } else if (state is CurrentLoadedState) {
            return MyGrid(
              animeList: state.animeList,
              judul: Dictionary.fall2020,
            );
          } else if (state is CurrentErrorState) {
            return BuildError(
              errorMsg: state.message,
            );
          }
          return null;
        },
      ),
    );
  }
}
