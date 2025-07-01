import 'package:equatable/equatable.dart';

abstract class InvestmentModeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event to fetch properties for a given investment mode
class FetchInvestmentModeEvent extends InvestmentModeEvent {
  final String mode;
  FetchInvestmentModeEvent(this.mode);

  @override
  List<Object?> get props => [mode];
}
