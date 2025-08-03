import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/data/models/get_notifications_response/get_notifications_response.dart';
import 'package:salvest_app/data/services/auth%20services/auth_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'user_notifications_event.dart';
part 'user_notifications_state.dart';

class UserNotificationsBloc
    extends Bloc<UserNotificationsEvent, UserNotificationsState> {
  final AuthRepoImpl _authRepoImpl;
  UserNotificationsBloc(this._authRepoImpl)
    : super(UserNotificationsInitial()) {
    on<GetUserNotificationsEvent>((event, emit) async {
      emit(UserNotificationsLoading());
      final resposne = await _authRepoImpl.getUserNotifcations(event);
      if (resposne is GetNotificationsResponse) {
        emit(UserNotificationsSuccess(getNotificationsResponse: resposne));
      } else {
        emit(UserNotificationsFailure(helperResponse: resposne));
      }
    });
  }
}
