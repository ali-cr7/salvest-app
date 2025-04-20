import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/data/models/faq_respone/faq_respone.dart';
import 'package:salvest_app/data/services/help%20services/help_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'help_event.dart';
part 'help_state.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  final HelpRepoImpl helpRepoImpl;

  HelpBloc(this.helpRepoImpl) : super(HelpInitial()) {
    on<GetFqmEvent>((event, emit) async {
      emit(FaqInLoadingState());
      final response = await helpRepoImpl.getFqm(event);
      if (response is FaqRespone) {
        emit(FaqDoneState(faqRespone: response));
      } else {
        emit(FaqLoadingFailure(helperResponse: response));
      }
    });
  }
}
