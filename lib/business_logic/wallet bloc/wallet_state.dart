part of 'wallet_bloc.dart';

@immutable
sealed class WalletState {}

final class WalletInitial extends WalletState {}

final class WalletChargeLoading extends WalletState {}

final class WalletChargeFailure extends WalletState {
  final HelperResponse helperResponse;

  WalletChargeFailure({required this.helperResponse});
}

final class WalletChargeSuccess extends WalletState {
  final String message;

  WalletChargeSuccess({required this.message});
}

final class GetWalletBalanceSuccess extends WalletState {
  final GetWalletBalanceResponse response;

  GetWalletBalanceSuccess({required this.response});
}

final class GetWalletPerecentageSuccess extends WalletState {
  final InvestmentOfWalletPercentageResponse response;

  GetWalletPerecentageSuccess({required this.response});
}

final class GetWalletBalanceFailure extends WalletState {
  final HelperResponse helperResponse;

  GetWalletBalanceFailure({required this.helperResponse});
}

final class GetWalletBalanceLoading extends WalletState {}

final class InvestFailure extends WalletState {
  final HelperResponse helperResponse;

  InvestFailure({required this.helperResponse});
}

final class InvestSuccess extends WalletState {
  final String message;

  InvestSuccess({required this.message});
}
final class TransferToInvestmentSuccess extends WalletState {
  final String message;

  TransferToInvestmentSuccess({required this.message});
}
final class TransferToInvestmentLoading extends WalletState {

}
final class TransferToInvestmentFailure extends WalletState {
  final HelperResponse helperResponse;

  TransferToInvestmentFailure({required this.helperResponse});
}

//TransferToInvestment
