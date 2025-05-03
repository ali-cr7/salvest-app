import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';
import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/get_wallet_balance_response/get_wallet_balance_response.dart';
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
  //   @override
  // Future getWalletBalance(WalletEvent event) async {
  //   late String endpoint;

  //   // Decide endpoint based on event type
  //   if (event is GetInvestmentWalletBalanceEvent) {
  //     endpoint = APIConfig.showInvestmentWallet;
  //   } else if (event is GetProfitWalletBalanceEvent) {
  //     endpoint = APIConfig.showProfitInvestmentWallet;
  //   } else {
  //     return HelperResponse(
  //       servicesResponse: ServicesResponseStatues.error,
  //       message: "Unsupported wallet event",
  //     );
  //   }

  //   final helperResponse = await _apiService.get(
  //     endpoint: endpoint,
  //     token: token,
  //   );

  //   if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
  //     try {
  //       final getWalletBalanceResponse =
  //           GetWalletBalanceResponse.from(helperResponse.fullBody!);
  //       return getWalletBalanceResponse;
  //     } catch (e) {
  //       return helperResponse.copyWith(
  //         servicesResponse: ServicesResponseStatues.modelError,
  //       );
  //     }
  //   }

  //   return helperResponse;
  // }

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
}
