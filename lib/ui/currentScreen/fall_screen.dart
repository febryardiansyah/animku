import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:animku/bloc/current_season_bloc/current_bloc_event.dart';
import 'package:animku/bloc/current_season_bloc/current_bloc_state.dart';
import 'package:animku/bloc/current_season_bloc/fall_bloc.dart';
import 'package:animku/components/build_error.dart';
import 'package:animku/components/build_loading.dart';
import 'package:animku/components/my_app_bar.dart';
import 'package:animku/components/my_grid.dart';
import 'package:animku/components/my_list.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/my_variable.dart';

class FallScreen extends StatefulWidget {
  @override
  _FallScreenState createState() => _FallScreenState();
}

class _FallScreenState extends State<FallScreen> {
  FallBloc fallBloc;

  @override
  Widget build(BuildContext context) {
    return MyAppbar(
      onRefresh: (){
        fallBloc = BlocProvider.of<FallBloc>(context);
        fallBloc.add(FetchCurrentEvent());
      },
      isList: MyVariable.isList,
      myList: BlocBuilder<FallBloc, CurrentBlocState>(
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
