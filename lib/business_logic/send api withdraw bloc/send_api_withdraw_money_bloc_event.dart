part of 'send_api_withdraw_money_bloc_bloc.dart';

@immutable
sealed class SendApiWithdrawMoneyBlocEvent {}
class WithdrawMoneyApiEvent extends SendApiWithdrawMoneyBlocEvent {
  WithdrawMoneyApiEvent({required this.withdrawMoneyState});
  final WithdrawMoneyState withdrawMoneyState;
  @override
  List<Object?> get props => [withdrawMoneyState];
}