import 'package:equatable/equatable.dart';

import 'data.largest.reward.dart';

class LargestRewardResponse extends Equatable {
  final String? message;
  final LargestReward? data;

  const LargestRewardResponse({this.message, this.data});

  factory LargestRewardResponse.fromJson(Map<String, dynamic> json) =>
      LargestRewardResponse(
        message: json['message'] as String?,
        data:
            json['data'] == null
                ? null
                : LargestReward.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

  @override
  List<Object?> get props => [message, data];
}
