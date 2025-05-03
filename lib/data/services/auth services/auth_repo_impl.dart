import 'dart:convert';

import 'package:salvest_app/business_logic/user/bloc/user_bloc.dart';
import 'package:salvest_app/data/models/log_in_response/log_in_response.dart';
import 'package:salvest_app/data/models/sign_up_response/sign_up_response.dart';
import 'package:salvest_app/data/services/auth%20services/auth_repo.dart';
import 'package:salvest_app/utility/api_config/api_config.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'package:salvest_app/utility/enums.dart';
import 'package:salvest_app/utility/handle_cash.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;
  
  AuthRepoImpl(this._apiService);
  @override
  Future register(SignUpEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.signUpEndpoint,
      data: {
        'name': event.fullName,
        'email': event.email,
        'password': event.password,
        'password_confirmation': event.verificationCode,
        'phone': event.phoneNumber,
        'role_id': '1',
      },
    );
    //  print(helperResponse.servicesResponse);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        var signUpResponse = SignUpResponse.from(helperResponse.fullBody!);
        return signUpResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }

  @override
  Future logIn(LogInEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.logInEndpoint,
      data: {'email': event.email, 'password': event.password},
    );
    //  print(helperResponse.servicesResponse);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        LogInResponse logInResponse = LogInResponse.from(
          helperResponse.fullBody!,
        );
        print('Full response: ${helperResponse.fullBody}');
 
        print(logInResponse.message);
        await setCache(logInResponse);
        return logInResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }

  @override
  Future resetPassword(ResetPasswordEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.resetPassword,
      data: {
        'email': event.email,
        'password': event.password,
        'password_confirmation': event.passWordConfirm,
      },
    );
    //  print(helperResponse.servicesResponse);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final responseBody = helperResponse.fullBody;
        return responseBody?['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }

  @override
  Future sendVerificationCode(SendVerificationCodeEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.sendVerificationCode,
      data: {'email': event.email},
    );
    //  print(helperResponse.servicesResponse);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final responseBody = helperResponse.fullBody;
        return responseBody?['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }

  @override
  Future verifyCode(VerifyCodeEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.verifyCode,
      data: {'email': event.email, 'verification_code': event.code},
    );
    //  print(helperResponse.servicesResponse);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final responseBody = helperResponse.fullBody;
        return responseBody?['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }
}
