 import 'package:salvest_app/business_logic/user/bloc/user_bloc.dart';

abstract class AuthRepo {

   Future register(SignUpEvent event);
   Future logIn(LogInEvent event);
    Future sendVerificationCode(SendVerificationCodeEvent event);
     Future resetPassword(ResetPasswordEvent event);
      Future verifyCode(VerifyCodeEvent event);
 }

