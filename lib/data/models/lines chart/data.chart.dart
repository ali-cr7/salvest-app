import 'package:equatable/equatable.dart';

import 'investment_percentages.chart.dart';
import 'profit_percentages.chart.dart';

class LinesChart extends Equatable {
  final InvestmentPercentages? investmentPercentages;
  final ProfitPercentages? profitPercentages;

  const LinesChart({this.investmentPercentages, this.profitPercentages});

  factory LinesChart.fromJson(Map<String, dynamic> json) => LinesChart(
    investmentPercentages:
        json['investment_percentages'] == null
            ? null
            : InvestmentPercentages.fromJson(
              json['investment_percentages'] as Map<String, dynamic>,
            ),
    profitPercentages:
        json['profit_percentages'] == null
            ? null
            : ProfitPercentages.fromJson(
              json['profit_percentages'] as Map<String, dynamic>,
            ),
  );

  Map<String, dynamic> toJson() => {
    'investment_percentages': investmentPercentages?.toJson(),
    'profit_percentages': profitPercentages?.toJson(),
  };

  @override
  List<Object?> get props => [investmentPercentages, profitPercentages];
}
