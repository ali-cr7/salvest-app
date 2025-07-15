part of 'auto_investment_settings_bloc.dart';

@immutable
abstract class AutoInvestmentSettingsEvent {}

class UpdateInvestmentAmountEvent extends AutoInvestmentSettingsEvent {
  final int amount;
  UpdateInvestmentAmountEvent({required this.amount});
}

class UpdateInvestmentModeEvent extends AutoInvestmentSettingsEvent {
  final String mode;
  UpdateInvestmentModeEvent({required this.mode});
}

class UpdateExpectedProfitMinEvent extends AutoInvestmentSettingsEvent {
  final int min;
  UpdateExpectedProfitMinEvent({required this.min});
}

class UpdateExpectedProfitMaxEvent extends AutoInvestmentSettingsEvent {
  final int max;
  UpdateExpectedProfitMaxEvent({required this.max});
}

class UpdateMinChanceInvestedEvent extends AutoInvestmentSettingsEvent {
  final int min;
  UpdateMinChanceInvestedEvent({required this.min});
}

class UpdateMaxChanceInvestedEvent extends AutoInvestmentSettingsEvent {
  final int max;
  UpdateMaxChanceInvestedEvent({required this.max});
}