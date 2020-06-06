import 'package:animku/bloc/current_season_bloc/current_bloc_state.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/repository/current_season_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'current_bloc_event.dart';

class FallBloc extends Bloc<CurrentEvent, CurrentBlocState> {
  CurrentSeasonRepository currentSeasonRepository;

  FallBloc(this.currentSeasonRepository);

  @override
  CurrentBlocState get initialState => CurrentInitialState();

  @override
  Stream<CurrentBlocState> mapEventToState(CurrentEvent event) async* {
    if (event is FetchCurrentEvent) {
      yield CurrentLoadingState();
      try {
        final List<AnimeList> list =
            await currentSeasonRepository.getFall2020();
        yield CurrentLoadedState(animeList: list);
      } catch (e) {
        yield CurrentErrorState(message: e as String);
      }
    }
  }
}
