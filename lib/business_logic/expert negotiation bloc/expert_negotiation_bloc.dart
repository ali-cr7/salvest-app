import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/data/models/expert_negotiation_response/expert_negotiation_response.dart';
import 'package:salvest_app/data/services/negotiation%20services/negotiation_repo_imp.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'expert_negotiation_event.dart';
part 'expert_negotiation_state.dart';

class ExpertNegotiationBloc
    extends Bloc<ExpertNegotiationEvent, ExpertNegotiationState> {
  final NegotiationRepoImp negotiationRepoImp;
  ExpertNegotiationBloc(this.negotiationRepoImp)
    : super(ExpertNegotiationInitial()) {
    on<GetExpertNegotiationEvent>((event, emit) async {
      emit(ExpertNegotiationLoading());
      final rsponse = await negotiationRepoImp.getNegotiationBox(event);
      if (rsponse is ExpertNegotiationResponse) {
        emit(ExpertNegotiationSuccess(expertNegotiationResponse: rsponse));
      } else {
        emit(ExpertNegotiationFailure(helperResponse: rsponse));
      }
    });

    on<AcceptExpertNegotiationEvent>((event, emit) async {
      emit(NegotiationLoading());
      final rsponse = await negotiationRepoImp.acceptNegotiationBox(event);
      if (rsponse is String) {
       
        emit(AcceptRejectNegotiationSuccess(message: rsponse));
         GetExpertNegotiationEvent();
      } else {
        emit(AcceptRejectNegotiationFailure(helperResponse: rsponse));
          GetExpertNegotiationEvent();
      }
    });

    on<RejectExpertNegotiationEvent>((event, emit) async {
      emit(NegotiationLoading());
      final rsponse = await negotiationRepoImp.rejectNegotiationBox(event);
      if (rsponse is String) {
        emit(AcceptRejectNegotiationSuccess(message: rsponse));
          GetExpertNegotiationEvent();
      } else {
        emit(AcceptRejectNegotiationFailure(helperResponse: rsponse));
          GetExpertNegotiationEvent();
      }
    });
  }
}
