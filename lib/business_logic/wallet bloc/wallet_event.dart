part of 'wallet_bloc.dart';

@immutable
sealed class WalletEvent {}

class ChargeInvestmentWalletEvent extends WalletEvent {
  ChargeInvestmentWalletEvent({required this.amount,required this.token});

  final int amount;
  final String token;

  @override
  List<Object?> get props => [amount];
}
class InvestEvent extends WalletEvent {
  InvestEvent({required this.chanceInvested,required this.propertyForInvestmentId});

  final int chanceInvested;
  final String propertyForInvestmentId;

  @override
  List<Object?> get props => [chanceInvested,propertyForInvestmentId];
}

class GetWalletBalanceEvent extends WalletEvent {
  GetWalletBalanceEvent();

  
  @override
  List<Object?> get props => [];
}
  class GetProfitsWalletBalanceEvent extends WalletEvent {
  GetProfitsWalletBalanceEvent();

  
  @override
  List<Object?> get props => [];
}
class GetWalletPercentageEvent extends WalletEvent {
  GetWalletPercentageEvent();

  
  @override
  List<Object?> get props => [];
}