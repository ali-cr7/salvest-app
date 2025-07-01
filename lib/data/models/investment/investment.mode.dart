import 'package:equatable/equatable.dart';

import 'datum.mode.dart';

class InvestmentModeResponse extends Equatable {
  final String? message;
  final List<InvestmentMode>? data;

  const InvestmentModeResponse({this.message, this.data});

  factory InvestmentModeResponse.fromJson(Map<String, dynamic> json) =>
      InvestmentModeResponse(
        message: json['message'] as String?,
        data:
            (json['data'] as List<dynamic>?)
                ?.map((e) => InvestmentMode.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [message, data];
}
