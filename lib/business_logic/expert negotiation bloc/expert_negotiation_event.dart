part of 'expert_negotiation_bloc.dart';

@immutable
sealed class ExpertNegotiationEvent {}

class GetExpertNegotiationEvent extends ExpertNegotiationEvent {}

class AcceptExpertNegotiationEvent extends ExpertNegotiationEvent {
  final String id;

  AcceptExpertNegotiationEvent({required this.id});
}

class RejectExpertNegotiationEvent extends ExpertNegotiationEvent {
  final String id;
  
  RejectExpertNegotiationEvent({required this.id});
}
