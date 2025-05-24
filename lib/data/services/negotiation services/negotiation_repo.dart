import 'package:salvest_app/business_logic/expert%20negotiation%20bloc/expert_negotiation_bloc.dart';

abstract class NegotiationRepo {
  Future getNegotiationBox(GetExpertNegotiationEvent event);
  Future acceptNegotiationBox(AcceptExpertNegotiationEvent event);
  Future rejectNegotiationBox(RejectExpertNegotiationEvent event);
}
