import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/data/models/search_user_response/search_user_response.dart';
import 'package:salvest_app/data/services/auth%20services/auth_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'search_user_email_event.dart';
part 'search_user_email_state.dart';

class SearchUserEmailBloc
    extends Bloc<SearchUserEmailEvent, SearchUserEmailState> {
  final AuthRepoImpl authRepoImpl;
  SearchUserEmailBloc(this.authRepoImpl) : super(SearchUserEmailInitial()) {
    on<SearhForUserEvent>((event, emit) async {
      emit(SearchUserEmailLoading());
      final response = await authRepoImpl.searchuserEvent(event);
      if (response is SearchUserResponse) {
        emit(SearchUserEmailSuccess(searchUserResponse: response));
      } else {
        emit(SearchUserEmailFailure(helperResponse: response));
      }
    });
  }
}
