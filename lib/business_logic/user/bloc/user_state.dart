part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

class UserErrorState extends UserState {
  UserErrorState({required this.helperResponse});
 final HelperResponse helperResponse;
  @override
  List<Object> get props => [helperResponse.servicesResponse,helperResponse.response];
}
class ResetSuccessState extends UserState {
  ResetSuccessState({required this.message});
 final String message;  
  @override
  List<Object> get props => [message];
}


class VerifiySuccessState extends UserState {
  VerifiySuccessState({required this.message});
 final String message;
  @override
  List<Object> get props => [message];
}
class SendVerificationSuccessState extends UserState {
  SendVerificationSuccessState({required this.message});
 final String message;
  @override
  List<Object> get props => [message];
}
//SendVerificationSuccessState

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}
class UserLoggedState extends UserState {
  UserLoggedState({required this.user});
 final SignUpResponse user;
  @override
  List<Object> get props => [user];
}
class UserLoginState extends UserState {
  UserLoginState({required this.user});
 final LogInResponse user;
  @override
  List<Object> get props => [user];
}