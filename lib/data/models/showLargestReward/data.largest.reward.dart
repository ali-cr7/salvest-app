import 'package:equatable/equatable.dart';

class LargestReward extends Equatable {
  final int? rewardId;
  final int? amountProfit;
  final String? level;

  const LargestReward({this.rewardId, this.amountProfit, this.level});

  factory LargestReward.fromJson(Map<String, dynamic> json) => LargestReward(
    rewardId: json['reward_id'] as int?,
    amountProfit: json['amount_profit'] as int?,
    level: json['level'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'reward_id': rewardId,
    'amount_profit': amountProfit,
    'level': level,
  };

  @override
  List<Object?> get props => [rewardId, amountProfit, level];
}
