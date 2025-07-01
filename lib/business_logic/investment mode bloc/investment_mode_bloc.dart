import 'package:bloc/bloc.dart';

import 'package:salvest_app/data/services/statistics%20srevices/statistics%20_repo_impl.dart';
import 'investment_mode_event.dart';
import 'investment_mode_state.dart';

class InvestmentModeBloc
    extends Bloc<InvestmentModeEvent, InvestmentModeState> {
  final StatisticsRepoImpl _repo;

  InvestmentModeBloc(this._repo) : super(InvestmentModeInitial()) {
    on<FetchInvestmentModeEvent>((event, emit) async {
      emit(InvestmentModeLoading());
      try {
        final response = await _repo.fetchInvestmentModes(event.mode);
        if (response.data != null && response.data!.isNotEmpty) {
          emit(InvestmentModeLoaded(response.data!));
        } else {
          emit(InvestmentModeError('لا توجد بيانات'));
        }
      } catch (e) {
        emit(InvestmentModeError(e.toString()));
      }
    });
  }
}
