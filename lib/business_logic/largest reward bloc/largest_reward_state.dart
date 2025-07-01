// lib/bloc/largest_reward/largest_reward_state.dart
import 'package:equatable/equatable.dart';
import 'package:salvest_app/data/models/showLargestReward/data.largest.reward.dart';

abstract class LargestRewardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LargestRewardInitial extends LargestRewardState {}

class LargestRewardLoading extends LargestRewardState {}

class LargestRewardLoaded extends LargestRewardState {
  final LargestReward reward;
  LargestRewardLoaded(this.reward);

  @override
  List<Object?> get props => [reward];
}

class LargestRewardError extends LargestRewardState {
  final String message;
  LargestRewardError(this.message);

  @override
  List<Object?> get props => [message];
}
