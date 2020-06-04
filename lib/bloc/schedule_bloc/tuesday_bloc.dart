import 'package:animku/bloc/schedule_bloc/shedule_event_state.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/repository/schedule_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TuesDayBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleRepository scheduleRepository;

  TuesDayBloc(this.scheduleRepository);

  @override
  // TODO: implement initialState
  ScheduleState get initialState => ScheduleInitialState();

  @override
  Stream<ScheduleState> mapEventToState(ScheduleEvent event) async* {
    if (event is FetchSchedule) {
      yield ScheduleInitialState();
      try {
        final List<AnimeList> list = await scheduleRepository.getTuesday();
        yield ScheduleLoadedState(animeList: list);
      } catch (e) {
        yield ScheduleErrorState(message: e.toString());
      }
    }
  }
}
