import 'package:equatable/equatable.dart';
import 'package:salvest_app/data/models/get_Investments_ByMonthAndYear/data.by.month.dart';

abstract class InvestmentsByMonthState extends Equatable {
  const InvestmentsByMonthState();
  @override
  List<Object?> get props => [];
}

class InvestmentsByMonthInitial extends InvestmentsByMonthState {}

class InvestmentsByMonthLoading extends InvestmentsByMonthState {}

class InvestmentsByMonthLoaded extends InvestmentsByMonthState {
  final InvestmentsByMonth data;
  const InvestmentsByMonthLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class InvestmentsByMonthError extends InvestmentsByMonthState {
  final String message;
  const InvestmentsByMonthError(this.message);

  @override
  List<Object?> get props => [message];
}
