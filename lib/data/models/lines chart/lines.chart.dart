import 'package:equatable/equatable.dart';

import 'data.chart.dart';

class LinesChartResponse extends Equatable {
  final String? message;
  final LinesChart? data;

  const LinesChartResponse({this.message, this.data});

  factory LinesChartResponse.fromJson(Map<String, dynamic> json) =>
      LinesChartResponse(
        message: json['message'] as String?,
        data:
            json['data'] == null
                ? null
                : LinesChart.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

  @override
  List<Object?> get props => [message, data];
}
