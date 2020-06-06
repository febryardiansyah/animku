import 'package:animku/bloc/current_season_bloc/current_bloc_event.dart';
import 'package:animku/bloc/current_season_bloc/current_bloc_state.dart';
import 'package:animku/bloc/current_season_bloc/winter_bloc.dart';
import 'package:animku/components/build_error.dart';
import 'package:animku/components/build_loading.dart';
import 'package:animku/components/my_app_bar.dart';
import 'package:animku/components/my_grid.dart';
import 'package:animku/components/my_list.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/my_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WinterScreen extends StatefulWidget {
  @override
  _WinterScreenState createState() => _WinterScreenState();
}

class _WinterScreenState extends State<WinterScreen> {
  WinterBloc winterBloc;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WinterBloc, CurrentBlocState>(
      listener: (context, state) {
        if (state is CurrentErrorState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: MyAppbar(
        onRefresh: () {
          winterBloc = BlocProvider.of<WinterBloc>(context);
          winterBloc.add(FetchCurrentEvent());
        },
        isList: MyVariable.isList,
        myList: BlocBuilder<WinterBloc, CurrentBlocState>(
          builder: (context, state) {
            if (state is CurrentInitialState) {
              return BuildLoading();
            } else if (state is CurrentLoadingState) {
              return BuildLoading();
            } else if (state is CurrentLoadedState) {
              return MyList(
                animeList: state.animeList,
                seasonTitle: Dictionary.winter2020,
              );
            } else if (state is CurrentErrorState) {
              return BuildError(
                errorMsg: state.message,
              );
            }
            return null;
          },
        ),
        myGrid: BlocBuilder<WinterBloc, CurrentBlocState>(
          builder: (context, state) {
            if (state is CurrentInitialState) {
              return BuildLoading();
            } else if (state is CurrentLoadingState) {
              return BuildLoading();
            } else if (state is CurrentLoadedState) {
              return MyGrid(
                animeList: state.animeList,
                judul: Dictionary.winter2020,
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
    );
  }
}
