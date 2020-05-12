import 'package:animku/models/current_season_model.dart';
import 'package:equatable/equatable.dart';

//fetch event
abstract class ScheduleEvent extends Equatable{}

class FetchSchedule extends ScheduleEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

//state
abstract class ScheduleState extends Equatable{}

class ScheduleInitialState extends ScheduleState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class ScheduleLoadedState extends ScheduleState{
  List<AnimeList> animeList;

  ScheduleLoadedState({this.animeList});

  @override
  // TODO: implement props
  List<Object> get props => [animeList];
}
class ScheduleErrorState extends ScheduleState{
  String message;

  ScheduleErrorState({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
