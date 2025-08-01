import 'package:salvest_app/business_logic/investing%20history%20bloc/inveseting_history_bloc.dart';
import 'package:salvest_app/business_logic/send%20api%20withdraw%20bloc/send_api_withdraw_money_bloc_bloc.dart';
import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';
import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/get_investing_history_response/get_investing_history_response.dart';

import 'package:salvest_app/data/models/get_my_investing_profits_history_response/get_my_investing_profits_history_response.dart';

import 'package:salvest_app/data/models/get_wallet_balance_response/get_wallet_balance_response.dart';
import 'package:salvest_app/data/models/investment_of_wallet_percentage_response/investment_of_wallet_percentage_response.dart';
import 'package:salvest_app/data/services/wallet%20services/wallet_services_repo.dart';
import 'package:salvest_app/utility/api_config/api_config.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'package:salvest_app/utility/enums.dart';

class WalletServicesRepoImpl implements WalletServicesRepo {
  final ApiService _apiService;

  WalletServicesRepoImpl(this._apiService);
  @override
  Future chargeWallet(ChargeInvestmentWalletEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.chargeInvestment,
      token: token,
      data: {
        'token': event.token,
        'amount': event.amount,
        'currency': "usd",
        "payment_method": 'visa',
        "description": "عملية دفع من العميل",
      },
    );
    print("the Helper Resposne for charging ${helperResponse.fullBody}");
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        var response = helperResponse.fullBody!['message'];
        return response;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }

  @override
  Future getWalletBalance(WalletEvent event) async {
    late String endpoint;
    if (event is GetWalletBalanceEvent) {
      endpoint = APIConfig.showInvestmentWallet;
    }
    if (event is GetProfitsWalletBalanceEvent) {
      endpoint = APIConfig.showProfitInvestmentWallet;
    }
    HelperResponse helperResponse = await _apiService.get(
      endpoint: endpoint,
      token: token,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        GetWalletBalanceResponse getWalletBalanceResponse =
            GetWalletBalanceResponse.from(helperResponse.fullBody!);
        return getWalletBalanceResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }

  @override
  Future invest(InvestEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.invest,
      token: token,
      data: {
        'chance_invested': event.chanceInvested,
        'property_for_investment_id': int.tryParse(
          event.propertyForInvestmentId,
        ),
      },
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        String message = helperResponse.fullBody!['message'];
        return message;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }

  @override
  Future getMyInvestingHistory(InvesetingHistoryEvent event, int page) async {
    if (event is GetInvestingHistory) {
      HelperResponse helperResponse = await _apiService.get(
        endpoint: "${APIConfig.getMyInvestingHistory}?page=$page",
        token: token,
      );
      print(" end point: ${APIConfig.getMyInvestingHistory}?page=$page");
      if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
        try {
          return GetInvestingHistoryResponse.from(helperResponse.fullBody!);
        } catch (e) {
          return helperResponse.copyWith(
            servicesResponse: ServicesResponseStatues.modelError,
          );
        }
      }
      return helperResponse;
    }

    if (event is GetInvestingProfitHistory) {
      HelperResponse helperResponse = await _apiService.get(
        endpoint: APIConfig.getMyInvestingProfitHistory,
        token: token,
      );
      print('here is the proofits${helperResponse.fullBody}');
      if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
        try {
          return GetMyInvestingProfitsHistoryResponse.from(
            helperResponse.fullBody!,
          );
        } catch (e) {
          return helperResponse.copyWith(
            servicesResponse: ServicesResponseStatues.modelError,
          );
        }
      }
      return helperResponse;
    }

    return HelperResponse(
      servicesResponse: ServicesResponseStatues.modelError,
      fullBody: {},
    );
  }

  @override
  Future getWalletPercentage(GetWalletPercentageEvent event) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: APIConfig.getInvestmentPercentage,
      token: token,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        InvestmentOfWalletPercentageResponse
        investmentOfWalletPercentageResponse =
            InvestmentOfWalletPercentageResponse.from(helperResponse.fullBody!);
        return investmentOfWalletPercentageResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }

  @override
  Future transferToInvestment(TransferToInvestmentWalletEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.transferToInvestment,
      token: token,
      data: {'amount': event.amount},
    );
  
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        String message = helperResponse.fullBody!['message'];
        return message;
        
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }

  @override
  Future withDrawMoney(WithdrawMoneyApiEvent event) async {
    try {
      final formData = await event.withdrawMoneyState.toFormData();
      HelperResponse helperResponse = await _apiService.post(
        endpoint: APIConfig.makeWithdrawalRequest,
        data: formData,
        token: token,
      );

      return helperResponse;
    } catch (e) {
      return HelperResponse(
        fullBody: {'error': 'Failed to prepare request: ${e.toString()}'},
        response: 'Failed to prepare property data',
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    }
  }
}

  // Future activateAutoInvestment(ActicvateAutoInvestmentApiEvent event) async {
  //   try {
  //     final formData = await event.autoInvestmentSettingsState.toFormData();
  //     HelperResponse helperResponse = await _apiService.post(
  //       endpoint: APIConfig.activateAutoInvestment,
  //       data: formData,
  //       token: token,
  //     );

  //     return helperResponse;
  //   } catch (e) {
  //     return HelperResponse(
  //       fullBody: {'error': 'Failed to prepare request: ${e.toString()}'},
  //       response: 'Failed to prepare property data',
  //       servicesResponse: ServicesResponseStatues.someThingWrong,
  //     );
  //   }
  // }