import 'package:animku/models/current_season_model.dart';
import 'package:animku/repository/season_later_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SeasonLaterEvent extends Equatable{}

class FetchSeasonLaterEvent extends SeasonLaterEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

abstract class SeasonLaterState extends Equatable{}

class SeasonLaterInitialState extends SeasonLaterState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class SeasonLaterLoadedState extends SeasonLaterState{
  List<AnimeList>animeList;

  SeasonLaterLoadedState({this.animeList});

  @override
  // TODO: implement props
  List<Object> get props => [animeList];
}
class SeasonLaterErrorState extends SeasonLaterState{
  String message;

  SeasonLaterErrorState({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class SeasonLaterBloc extends Bloc<SeasonLaterEvent,SeasonLaterState>{
  SeasonLaterRepository seasonLaterRepository;

  SeasonLaterBloc({this.seasonLaterRepository});

  @override
  // TODO: implement initialState
  SeasonLaterState get initialState => SeasonLaterInitialState();

  @override
  Stream<SeasonLaterState> mapEventToState(SeasonLaterEvent event) async*{
    if(event is FetchSeasonLaterEvent){
      yield SeasonLaterInitialState();
      try{
        List<AnimeList> animeList = await seasonLaterRepository.fetchSeasonLater();
        yield SeasonLaterLoadedState(animeList: animeList);
      }catch(e){
        yield SeasonLaterErrorState(message: e.toString());
      }
    }
  }
}