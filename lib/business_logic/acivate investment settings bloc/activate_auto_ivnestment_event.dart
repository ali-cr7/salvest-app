part of 'activate_auto_ivnestment_bloc.dart';

@immutable
sealed class ActivateAutoIvnestmentEvent {}
class ActicvateAutoInvestmentApiEvent extends ActivateAutoIvnestmentEvent {
  ActicvateAutoInvestmentApiEvent({required this.autoInvestmentSettingsState});
  final AutoInvestmentSettingsState autoInvestmentSettingsState;
  @override
  List<Object?> get props => [autoInvestmentSettingsState];
}

class DeActicvateAutoInvestmentApiEvent extends ActivateAutoIvnestmentEvent {

  @override
  List<Object?> get props => [];
}