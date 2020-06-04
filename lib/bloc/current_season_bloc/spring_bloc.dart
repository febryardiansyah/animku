import 'package:animku/bloc/current_season_bloc/current_bloc_event.dart';
import 'package:animku/bloc/current_season_bloc/current_bloc_state.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/repository/current_season_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpringBloc extends Bloc<CurrentEvent,CurrentBlocState>{
  CurrentSeasonRepository currentSeasonRepository;

  SpringBloc(this.currentSeasonRepository);

  @override
  // TODO: implement initialState
  CurrentBlocState get initialState => CurrentInitialState();

  @override
  Stream<CurrentBlocState> mapEventToState(CurrentEvent event)async* {
    // TODO: implement mapEventToState
    if(event is FetchCurrentEvent){
      yield CurrentLoadingState();
      try{
        final List<AnimeList> animeList = await currentSeasonRepository.getSpring2020();
        yield CurrentLoadedState(animeList: animeList);
      }catch(e){
        yield CurrentErrorState(message: e.toString());
      }
    }
  }
}