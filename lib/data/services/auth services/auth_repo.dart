import 'package:salvest_app/business_logic/search%20user%20email%20bloc/search_user_email_bloc.dart';
import 'package:salvest_app/business_logic/user%20notifications%20bloc/user_notifications_bloc.dart';
import 'package:salvest_app/business_logic/user/bloc/user_bloc.dart';

abstract class AuthRepo {
  Future register(SignUpEvent event);
  Future logIn(LogInEvent event, String fcm);
  Future sendVerificationCode(SendVerificationCodeEvent event);
  Future resetPassword(ResetPasswordEvent event);
  Future verifyCode(VerifyCodeEvent event);
  Future storeFcmToken(String fcm);
  Future getUserNotifcations(GetUserNotificationsEvent event);
  Future searchuserEvent(SearhForUserEvent event);
}
