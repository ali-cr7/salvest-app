import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:salvest_app/data/models/get_wallet_balance_response/get_wallet_balance_response.dart';
import 'package:salvest_app/data/models/investment_of_wallet_percentage_response/investment_of_wallet_percentage_response.dart';
import 'package:salvest_app/data/services/wallet%20services/wallet_services_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletServicesRepoImpl walletServicesRepoImpl;
  WalletBloc(this.walletServicesRepoImpl) : super(WalletInitial()) {
    on<ChargeInvestmentWalletEvent>((event, emit) async {
      emit(WalletChargeLoading());
      final response = await walletServicesRepoImpl.chargeWallet(event);
      if (response is String) {
        emit(WalletChargeSuccess(message: response));
      } else {
        emit(WalletChargeFailure(helperResponse: response));
      }
    });

    on<GetWalletBalanceEvent>((event, emit) async {
      emit(GetWalletBalanceLoading());
      final response = await walletServicesRepoImpl.getWalletBalance(event);
      if (response is GetWalletBalanceResponse) {
        emit(GetWalletBalanceSuccess(response: response));
      } else {
        emit(GetWalletBalanceFailure(helperResponse: response));
      }
    });
     on<GetProfitsWalletBalanceEvent>((event, emit) async {
      emit(GetWalletBalanceLoading());
      final response = await walletServicesRepoImpl.getWalletBalance(event);
      if (response is GetWalletBalanceResponse) {
        emit(GetWalletBalanceSuccess(response: response));
      } else {
        emit(GetWalletBalanceFailure(helperResponse: response));
      }
    });

    on<InvestEvent>((event, emit) async {
      emit(GetWalletBalanceLoading());
      final response = await walletServicesRepoImpl.invest(event);
      if (response is String) {
        emit(InvestSuccess(message: response));
      } else {
        emit(InvestFailure(helperResponse: response));
      }
    });
         on<GetWalletPercentageEvent>((event, emit) async {
      emit(GetWalletBalanceLoading());
      final response = await walletServicesRepoImpl.getWalletPercentage(event);
      if (response is InvestmentOfWalletPercentageResponse) {
        emit(GetWalletPerecentageSuccess(response: response));
      } else {
        emit(GetWalletBalanceFailure(helperResponse: response));
      }
    });
    // InvestEvent
  }
}
