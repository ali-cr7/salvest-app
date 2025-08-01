part of 'activate_auto_ivnestment_bloc.dart';

@immutable
sealed class ActivateAutoIvnestmentState {}

final class ActivateAutoIvnestmentInitial extends ActivateAutoIvnestmentState {}
final class ActivateAutoIvnestmentLoading extends ActivateAutoIvnestmentState {}


class ActicvateAutoInvestmentStatus extends ActivateAutoIvnestmentState {
  ActicvateAutoInvestmentStatus({required this.helperResponse});

final  HelperResponse helperResponse;

  @override
  List<Object> get props => [
    helperResponse.servicesResponse,
    helperResponse.response,
  ];
} 
