part of 'expert_negotiation_bloc.dart';

@immutable
sealed class ExpertNegotiationState {}

final class ExpertNegotiationInitial extends ExpertNegotiationState {}

final class ExpertNegotiationLoading extends ExpertNegotiationState {}
final class NegotiationLoading extends ExpertNegotiationState {}

final class ExpertNegotiationFailure extends ExpertNegotiationState {
  final HelperResponse helperResponse;

  ExpertNegotiationFailure({required this.helperResponse});
}

final class ExpertNegotiationSuccess extends ExpertNegotiationState {
  final ExpertNegotiationResponse expertNegotiationResponse;

  ExpertNegotiationSuccess({required this.expertNegotiationResponse});
}
final class AcceptRejectNegotiationSuccess extends ExpertNegotiationState {
  final String message;

  AcceptRejectNegotiationSuccess({required this.message});
}
final class AcceptRejectNegotiationFailure extends ExpertNegotiationState {
  final HelperResponse helperResponse;

  AcceptRejectNegotiationFailure({required this.helperResponse});
}


