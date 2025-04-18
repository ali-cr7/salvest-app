import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/data/models/log_in_response/log_in_response.dart';
import 'package:salvest_app/data/models/sign_up_response/sign_up_response.dart';
import 'package:salvest_app/data/models/sign_up_response/user.dart';
import 'package:salvest_app/data/services/auth%20services/auth_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'package:salvest_app/utility/enums.dart';
import 'package:salvest_app/utility/handle_cash.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepoImpl authRepoImpl;
  UserBloc(this.authRepoImpl) : super(UserInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(UserLoading());
      final response = await authRepoImpl.register(event);
      print(response is SignUpResponse);
      print(response is HelperResponse);
      if (response is SignUpResponse) {
        print(response);
        emit(UserLoggedState(user: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });
    on<LogInEvent>((event, emit) async {
      emit(UserLoading());
      final response = await authRepoImpl.logIn(event);

      if (response is LogInResponse) {
        emit(UserLoginState(user: response));
        print('hiii');
        print(response.token);
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });
    on<ResetPasswordEvent>((event, emit) async {
      emit(UserLoading());
      final response = await authRepoImpl.resetPassword(event);

      if (response is String) {
        print('hjjj lll');
        emit(ResetSuccessState(message: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });

    on<SendVerificationCodeEvent>((event, emit) async {
      emit(UserLoading());
      final response = await authRepoImpl.sendVerificationCode(event);

      if (response is String) {
        emit(SendVerificationSuccessState(message: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });

    on<VerifyCodeEvent>((event, emit) async {
      emit(UserLoading());
      final response = await authRepoImpl.verifyCode(event);

      if (response is String) {
        emit(VerifiySuccessState(message: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });
  }
}
