import 'package:bloc/bloc.dart';
import 'package:salvest_app/data/models/get_Investments_ByMonthAndYear/investments.by.month.dart';

import 'package:salvest_app/data/services/statistics%20srevices/statistics%20_repo_impl.dart';

import 'investments_by_month_event.dart';
import 'investments_by_month_state.dart';

class InvestmentsByMonthBloc
    extends Bloc<InvestmentsByMonthEvent, InvestmentsByMonthState> {
  final StatisticsRepoImpl _repo;

  InvestmentsByMonthBloc(this._repo) : super(InvestmentsByMonthInitial()) {
    on<FetchInvestmentsByMonthEvent>((event, emit) async {
      emit(InvestmentsByMonthLoading());
      try {
        final InvestmentsByMonthResponse resp = await _repo.fetchByMonth(
          event.year,
          event.month,
        );
        if (resp.data != null) {
          emit(InvestmentsByMonthLoaded(resp.data!));
        } else {
          emit(const InvestmentsByMonthError('لا توجد بيانات'));
        }
      } catch (e) {
        emit(InvestmentsByMonthError(e.toString()));
      }
    });
  }
}
