import 'package:animku/models/current_season_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CurrentBlocState extends Equatable{}

class CurrentInitialState extends CurrentBlocState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CurrentLoadingState extends CurrentBlocState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CurrentLoadedState extends CurrentBlocState{

  List<AnimeList>animeList;
  CurrentLoadedState({@required this.animeList});

  @override
  // TODO: implement props
  List<Object> get props => [animeList];

}
class CurrentErrorState extends CurrentBlocState{
  String message;
  CurrentErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];

}