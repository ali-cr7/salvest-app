import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/data/models/get_investing_history_response/get_investing_history_response.dart';
import 'package:salvest_app/data/models/get_investing_history_response/property.dart';
import 'package:salvest_app/data/models/get_my_investing_profits_history_response/get_my_investing_profits_history_response.dart';
import 'package:salvest_app/data/models/get_my_investing_profits_history_response/property.dart';

import 'package:salvest_app/data/services/wallet%20services/wallet_services_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'inveseting_history_event.dart';
part 'inveseting_history_state.dart';

class InvesetingHistoryBloc
    extends Bloc<InvesetingHistoryEvent, InvesetingHistoryState> {
  final WalletServicesRepoImpl walletServicesRepoImpl;
  InvesetingHistoryBloc(this.walletServicesRepoImpl)
    : super(InvesetingHistoryInitial()) {
    on<GetInvestingHistory>((event, emit) async {
      final currentState = state;
      final kLimit = 5;

      if (currentState is InvesetingHistorySuccess &&
          currentState.hasReachedMax) {
        return;
      }

      final page =
          (currentState is InvesetingHistorySuccess)
              ? (currentState.investedProprties.length ~/ kLimit) + 1
              : 1;

      final response = await walletServicesRepoImpl.getMyInvestingHistory(
        event,
        page,
      );

      if (response is GetInvestingHistoryResponse) {
        final hasReachedMax = response.data!.properties!.length < kLimit;
        if (currentState is InvesetingHistorySuccess) {
          emit(
            currentState.copyWith(
              investedProprties: List.of(currentState.investedProprties)
                ..addAll(response.data!.properties!),
              hasReachedMax: hasReachedMax,
            ),
          );
        } else {
          emit(
            InvesetingHistorySuccess(
              investedProprties: response.data!.properties!,
              hasReachedMax: hasReachedMax,
            ),
          );
        }
      } else {
        emit(InvesetingHistoryFailure(helperResponse: response));
      }
    });

    on<GetInvestingProfitHistory>((event, emit) async {
      final currentState = state;
      final kLimit = 5;

      if (currentState is GetWalletProfitsSuccessState &&
          currentState.hasReachedMax) {
        return;
      }

      final page =
          (currentState is GetWalletProfitsSuccessState)
              ? (currentState.propertyProfits!.length ~/ kLimit) + 1
              : 1;

      final response = await walletServicesRepoImpl.getMyInvestingHistory(
        event,
        page,
      );

      if (response is GetMyInvestingProfitsHistoryResponse) {
        final hasReachedMax = response.data!.properties!.length < kLimit;
        if (currentState is GetWalletProfitsSuccessState) {
          emit(
            currentState.copyWith(
              propertyProfits: List.of(currentState.propertyProfits!)
                ..addAll(response.data!.properties!),
              hasReachedMax: hasReachedMax,
            ),
          );
        } else {
          emit(
            GetWalletProfitsSuccessState(
              propertyProfits: response.data!.properties!,
              hasReachedMax: hasReachedMax,
            ),
          );
        }
      } else {
        emit(InvesetingHistoryFailure(helperResponse: response));
      }
    });
  }
}
