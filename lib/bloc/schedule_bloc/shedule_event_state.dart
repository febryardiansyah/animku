import 'package:animku/models/current_season_model.dart';
import 'package:equatable/equatable.dart';

//fetch event
abstract class ScheduleEvent extends Equatable {}

class FetchSchedule extends ScheduleEvent {
  @override
  List<Object> get props => [];
}

//state
abstract class ScheduleState extends Equatable {}

class ScheduleInitialState extends ScheduleState {
  @override
  List<Object> get props => [];
}

class ScheduleLoadedState extends ScheduleState {
  final List<AnimeList> animeList;

  ScheduleLoadedState({this.animeList});

  @override
  List<Object> get props => [animeList];
}

class ScheduleErrorState extends ScheduleState {
  final String message;

  ScheduleErrorState({this.message});

  @override
  List<Object> get props => [message];
}
