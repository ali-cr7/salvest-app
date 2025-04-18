part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class SignUpEvent extends UserEvent {
  SignUpEvent({
    required this.password,
    required this.phoneNumber,
    required this.email,
    required this.fullName,

    required this.verificationCode,
  });
  final String phoneNumber;
  final String password;
  final String email;
  final String fullName;

  final String verificationCode;
  @override
  List<Object?> get props => [
    phoneNumber,
    password,
    email,
    fullName,
    verificationCode,
  ];
}

class LogInEvent extends UserEvent {
  LogInEvent({required this.password, required this.email});

  final String password;
  final String email;

  @override
  List<Object?> get props => [password, email];
}

class ResetPasswordEvent extends UserEvent {
  ResetPasswordEvent( {required this.passWordConfirm,required this.password, required this.email});

  final String password;
  final String email;
  final String passWordConfirm;

  @override
  List<Object?> get props => [password, email];
}

class SendVerificationCodeEvent extends UserEvent {
  SendVerificationCodeEvent({required this.email});

  
  final String email;

  @override
  List<Object?> get props => [ email];
}

class VerifyCodeEvent extends UserEvent {
  VerifyCodeEvent({required this.code, required this.email});

  final String code;
  final String email;

  @override
  List<Object?> get props => [code, email];
}
