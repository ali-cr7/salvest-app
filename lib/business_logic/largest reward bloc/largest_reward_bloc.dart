import 'package:bloc/bloc.dart';

import 'package:salvest_app/data/services/statistics%20srevices/statistics%20_repo_impl.dart';
import 'largest_reward_event.dart';
import 'largest_reward_state.dart';

class LargestRewardBloc extends Bloc<LargestRewardEvent, LargestRewardState> {
  final StatisticsRepoImpl _repo;

  LargestRewardBloc(this._repo) : super(LargestRewardInitial()) {
    on<FetchLargestRewardEvent>((event, emit) async {
      emit(LargestRewardLoading());
      try {
        final response = await _repo.fetchLargestReward();
        if (response.data != null) {
          emit(LargestRewardLoaded(response.data!));
        } else {
          emit(LargestRewardError('لا توجد بيانات'));
        }
      } catch (e) {
        emit(LargestRewardError(e.toString()));
      }
    });
  }
}
