import 'package:equatable/equatable.dart';

class InvestmentMode extends Equatable {
  final int? id;
  final String? propertyName;
  final String? propertyLocation;
  final String? profitPercent;
  final String? investmentStartTime;
  final String? investmentEndTime;
  final int? investorCount;
  final int? userProfit;
  final int? isCompleted;

  const InvestmentMode({
    this.id,
    this.propertyName,
    this.propertyLocation,
    this.profitPercent,
    this.investmentStartTime,
    this.investmentEndTime,
    this.investorCount,
    this.userProfit,
    this.isCompleted,
  });

  factory InvestmentMode.fromJson(Map<String, dynamic> json) => InvestmentMode(
    id: json['id'] as int?,
    propertyName: json['property_name'] as String?,
    propertyLocation: json['property_location'] as String?,
    profitPercent: json['profit_percent'] as String?,
    investmentStartTime: json['investment_start_time'] as String?,
    investmentEndTime: json['investment_end_time'] as String?,
    investorCount: json['investor_count'] as int?,
    userProfit: json['user_profit'] as int?,
    isCompleted: json['is_completed'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'property_name': propertyName,
    'property_location': propertyLocation,
    'profit_percent': profitPercent,
    'investment_start_time': investmentStartTime,
    'investment_end_time': investmentEndTime,
    'investor_count': investorCount,
    'user_profit': userProfit,
    'is_completed': isCompleted,
  };

  @override
  List<Object?> get props {
    return [
      id,
      propertyName,
      propertyLocation,
      profitPercent,
      investmentStartTime,
      investmentEndTime,
      investorCount,
      userProfit,
      isCompleted,
    ];
  }
}
