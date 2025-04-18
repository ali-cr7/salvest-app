part of 'send_property_bloc.dart';

@immutable
sealed class SendPropertyState {}

final class SendPropertyInitial extends SendPropertyState {}
class SendPropertyLoading extends SendPropertyState {
  @override
  List<Object> get props => [];
}

class SendPropertyStatus extends SendPropertyState {
  SendPropertyStatus({required this.helperResponse});

  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse.servicesResponse,helperResponse.response];
}
