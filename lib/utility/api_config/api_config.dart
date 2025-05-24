import 'dart:io';

import 'package:dio/dio.dart';

class APIConfig {
  static String baseUrl =
      // 'http:// 192.168.119.1/';
      Platform.isAndroid ? 'http://10.0.2.2:8000/' : 'http://127.0.0.1:8000/';

  static const String signUpEndpoint = 'api/signup';
  static const String logInEndpoint = 'api/login';
  static const String sendVerificationCode = 'api/send_verification_code';
  static const String verifyCode = 'api/verify_code';
  static const String resetPassword = 'api/reset_password';
  static const String sendPropertyForSale = 'api/create_properties';
  static const String getCommonQuestions = 'api/get_FrequentlyQuestions';
  static const String updatePropertyRequest = 'api/update_properties_by_user/';
  static const String getPrpertyRequests = 'api/get_my_properties';
  static const String createQuestionByUser = 'api/create_question_by_user';
  static const String getMyQuestion = 'api/get_myQuestion';
  static const String chargeInvestment = 'api/stripe/ChargeInvestmentWallet';
  static const String showInvestmentWallet = 'api/wallets/ShowInvestmentWallet';
  static const String showProfitInvestmentWallet =
      'api/wallets/ShowProfitWallet';
  static const String getOfferedProperties = 'api/get_my_properties';
  static const String getPrpertyForInvestments = 'api/ShowPropertyByType';
  static const String invest = '/api/invest';
  static const String getMyInvestingHistory = 'api/ShowListOfUserInvestment';
  static const String getMyInvestingProfitHistory = 'api/ShowListOfUserProfit';
  static const String getInvestmentPercentage =
      'api/ShowPercentageOfInvestments';
  static const String getFcmToken = 'api/storeFcmToken';
  static const String showListOfUserInvestmentByInvestMode =
      'api/ShowListOfUserInvestmentByInvestMode';
  static const String getAgreedNegotiation =
      'api/get_Agreed_Negotiation_for_user';
  static const String acceptNegotiation =
      'api/accept_Agreed_Negotiation_by_user/';

  static const String rejecttNegotiation =
      'api/reject_Agreed_Negotiation_by_user/';
     
}
