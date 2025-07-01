import 'package:equatable/equatable.dart';

class InvestmentsByMonth extends Equatable {
  final int? totalOpportunities;
  final int? totalAmount;

  const InvestmentsByMonth({this.totalOpportunities, this.totalAmount});

  factory InvestmentsByMonth.fromJson(Map<String, dynamic> json) =>
      InvestmentsByMonth(
        totalOpportunities: json['total_opportunities'] as int?,
        totalAmount: json['total_amount'] as int?,
      );

  Map<String, dynamic> toJson() => {
    'total_opportunities': totalOpportunities,
    'total_amount': totalAmount,
  };

  @override
  List<Object?> get props => [totalOpportunities, totalAmount];
}
