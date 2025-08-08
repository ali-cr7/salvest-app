import 'dart:io';

import 'package:dio/dio.dart';

class APIConfig {
  static String baseUrl = 
  //'http://192.168.1.12:8000/';
  //'http://10.42.0.1:8000/';
  //'http://192.168.43.106:8000/';
  // 'http://  192.168.137.147:8000';
     Platform.isAndroid ? 'http://10.0.2.2:8000/' : 'http://127.0.0.1:8000/';
  static const String signUpEndpoint = 'api/v1/signup';
  static const String logInEndpoint = 'api/v1/login';
  static const String sendVerificationCode = 'api/v1/send_verification_code';
  static const String verifyCode = 'api/v1/verify_code';
  static const String resetPassword = 'api/v1/reset_password';
  static const String sendPropertyForSale = 'api/v1/create_properties';
  static const String getCommonQuestions = 'api/v1/get_FrequentlyQuestions';
  static const String updatePropertyRequest =
      'api/v1/update_properties_by_user/';
  static const String getPrpertyRequests = 'api/v1/get_my_properties';
  static const String createQuestionByUser = 'api/v1/create_question_by_user';
  static const String getMyQuestion = 'api/v1/get_myQuestion';
  static const String chargeInvestment = 'api/v1/stripe/ChargeInvestmentWallet';
  static const String showInvestmentWallet =
      'api/v1/wallets/ShowInvestmentWallet';
  static const String showProfitInvestmentWallet =
      'api/v1/wallets/ShowProfitWallet';
  static const String getOfferedProperties = 'api/v1/get_my_properties';
  static const String getPrpertyForInvestments = 'api/v1/ShowPropertyByType';
  static const String invest = '/api/v1/invest';
  static const String getMyInvestingHistory = 'api/v1/ShowListOfUserInvestment';
  static const String getMyInvestingProfitHistory =
      'api/v1/ShowListOfUserProfit';
  static const String getInvestmentPercentage =
      'api/v1/ShowPercentageOfInvestments';
  static const String getFcmToken = 'api/v1/storeFcmToken';
  static const String showListOfUserInvestmentByInvestMode =
      'api/v1/ShowListOfUserInvestmentByInvestMode';
  static const String getAgreedNegotiation =
      'api/v1/get_Agreed_Negotiation_for_user';
  static const String acceptNegotiation =
      'api/v1/accept_Agreed_Negotiation_by_user/';
  static const String rejecttNegotiation =
      'api/v1/reject_Agreed_Negotiation_by_user/';
  static const String shoLargestReward = 'api/v1/show_Largest_Reward';
  static const String getPropertiesByInvestmentMode =
      'api/v1/get_Properties_By_InvestmentMode_for_user';
  static const String getInvestmentsByMonthAndYear =
      'api/v1/get_Investments_ByMonthAndYear';
  static const String getProfitAndInvestmentPercentages =
      'api/v1/get_Profit_Percentage_AND_User_Investment_Percentage_ByMonth';
  static const String getElectronicCertificates =
      'api/v1/get_Electronic_Property_Certificate_for_user';
  static const String activateAutoInvestment =
      "api/v1/automatic_investment/activate";
  static const String deactivateAutoInvestment =
      "/api/v1/automatic_investment/deactivate";
  static const String transferToInvestment = "/api/v1/transfer_To_Investment";
  static const String makeWithdrawalRequest =
      "/api/v1/withdrawals/make_request";
  static const String getAllWithdrawalRequestForUser =
      "/api/v1/getAllWithdrawalRequestForUser";
  static const String getNotifications = 'api/v1/notifications';
  static const String transferOwnership =
      'api/v1/transfer_Investment_Ownership';
  static const String getOwneredProprties =
      'api/v1/get_all_investment_certificates_for_user';
  static const String searchAboutUser = 'api/v1/search_about_user';
}
