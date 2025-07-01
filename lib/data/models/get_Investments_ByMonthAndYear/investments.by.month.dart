import 'package:equatable/equatable.dart';

import 'data.by.month.dart';

class InvestmentsByMonthResponse extends Equatable {
  final String? message;
  final InvestmentsByMonth? data;

  const InvestmentsByMonthResponse({this.message, this.data});

  factory InvestmentsByMonthResponse.fromJson(Map<String, dynamic> json) =>
      InvestmentsByMonthResponse(
        message: json['message'] as String?,
        data:
            json['data'] == null
                ? null
                : InvestmentsByMonth.fromJson(
                  json['data'] as Map<String, dynamic>,
                ),
      );

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

  @override
  List<Object?> get props => [message, data];
}
