// lib/business_logic/investments_by_month_bloc/investments_by_month_event.dart
import 'package:equatable/equatable.dart';

abstract class InvestmentsByMonthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchInvestmentsByMonthEvent extends InvestmentsByMonthEvent {
  final int year;
  final int month;

  FetchInvestmentsByMonthEvent({required this.year, required this.month});

  @override
  List<Object?> get props => [year, month];
}
