part of 'send_api_withdraw_money_bloc_bloc.dart';

@immutable
sealed class SendApiWithdrawMoneyBlocState {}

final class SendApiWithdrawMoneyBlocInitial extends SendApiWithdrawMoneyBlocState {}
final class SendApiWithdrawMoneyLoading extends SendApiWithdrawMoneyBlocState {}
class  SendApiWithdrawMoneyStatus extends SendApiWithdrawMoneyBlocState {
  SendApiWithdrawMoneyStatus({required this.helperResponse});

final  HelperResponse helperResponse;

  @override
  List<Object> get props => [
    helperResponse.servicesResponse,
    helperResponse.response,
  ];
} 