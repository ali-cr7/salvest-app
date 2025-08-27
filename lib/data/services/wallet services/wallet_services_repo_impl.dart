import 'package:salvest_app/business_logic/deputizations%20bloc/deputizations_bloc.dart';
import 'package:salvest_app/business_logic/investing%20history%20bloc/inveseting_history_bloc.dart';
import 'package:salvest_app/business_logic/send%20api%20withdraw%20bloc/send_api_withdraw_money_bloc_bloc.dart';
import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';
import 'package:salvest_app/business_logic/withdrawls%20request%20bloc/withdrawls_request_bloc.dart';
import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/get_investing_history_response/get_investing_history_response.dart';

import 'package:salvest_app/data/models/get_my_investing_profits_history_response/get_my_investing_profits_history_response.dart';

import 'package:salvest_app/data/models/get_wallet_balance_response/get_wallet_balance_response.dart';
import 'package:salvest_app/data/models/investment_of_wallet_percentage_response/investment_of_wallet_percentage_response.dart';
import 'package:salvest_app/data/models/my_withdrawls_requests/my_withdrawls_requests_reponse.dart';
import 'package:salvest_app/data/models/get_deputaiztion_for_user_response/get_deputaiztion_for_user_response.dart';
import 'package:salvest_app/data/services/wallet%20services/wallet_services_repo.dart';
import 'package:salvest_app/utility/api_config/api_config.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'package:salvest_app/utility/enums.dart';

import '../../models/my_withdrawls_requests/my_withdrawls_requests.dart';

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
      print("the withdraw response ${helperResponse.fullBody}");
      print("the withdraw request ${formData.fields}");
      return helperResponse;
    } catch (e) {
      return HelperResponse(
        fullBody: {'error': 'Failed to prepare request: ${e.toString()}'},
        response: 'Failed to prepare property data',
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    }
  }

  @override
  Future getWithdrawlsRequests(GetWithdrawlsRequest event) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: 'api/v1/getAllWithdrawalRequestForUser',
      token: token,
    );
    print(helperResponse.fullBody);
    print(helperResponse.servicesResponse);
    print(helperResponse.response);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        MyWithdrawlsRequestsReponse myWithdrawlsRequestsReponse =
            MyWithdrawlsRequestsReponse.from(helperResponse.fullBody!);
        return myWithdrawlsRequestsReponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }

  @override
  Future createDeputizations(CreateDeputizationsEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.createDeputizations,
      token: token,
      data: {
        'ID_Number': event.nationalId,
        'deputization_Content': event.deputizationContent,

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
  Future getAllDeputizationsForUser() async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: APIConfig.getAllDeputizationsForUser,
      token: token,
    );
    print("the Helper Response for getting deputizations ${helperResponse.fullBody}");
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        GetDeputaiztionForUserResponse deputizationResponse =
            GetDeputaiztionForUserResponse.fromMessageDataDeputizationsId1UserId1UserNameIdNumber123456787DeputizationContentAsgrshgreherDeputizationImageNullStatusProcessedCreatedAt20250821T163606000000ZUpdatedAt20250823T080050000000ZId2UserId1UserNameIdNumber66666DeputizationContentITheUndersignedUserHerebyAuthorizeAndDeputizeSalvestPlatformNtoActOnMyBehalfInRelationToThePurchaseSaleAndTransferOfNrealEstatePropertiesThroughThePlatformNNThisAuthorizationGrantsThePlatformFullPowerToRepresentMeInCarryingNoutAllNecessaryLegalContractualAndAdministrativeProceduresRequiredNforCompletingTransactionsIncludingButNotLimitedToSigningContractsNsubmittingOrReceivingRelatedDocumentsAndFulfillingObligationsNtowardsThirdPartiesWithoutTheNeedForMyPhysicalPresenceNNThisDeputizationIsGivenInOrderToFacilitateTheInvestmentProcessNstreamlinePropertyTransactionsAndEnsureComplianceWithApplicableNlawsAndRegulationsDeputizationImageNullStatusProcessedCreatedAt20250822T114213000000ZUpdatedAt20250826T225902000000ZId3UserId1UserNameIdNumber123456DeputizationContentITheUndersignedUserHerebyAuthorizeAndDeputizeSalvestPlatformNtoActOnMyBehalfInRelationToThePurchaseSaleAndTransferOfNrealEstatePropertiesThroughThePlatformNNThisAuthorizationGrantsThePlatformFullPowerToRepresentMeInCarryingNoutAllNecessaryLegalContractualAndAdministrativeProceduresRequiredNforCompletingTransactionsIncludingButNotLimitedToSigningContractsNsubmittingOrReceivingRelatedDocumentsAndFulfillingObligationsNtowardsThirdPartiesWithoutTheNeedForMyPhysicalPresenceNNThisDeputizationIsGivenInOrderToFacilitateTheInvestmentProcessNstreamlinePropertyTransactionsAndEnsureComplianceWithApplicableNlawsAndRegulationsDeputizationImageNullStatusProcessedCreatedAt20250823T063041000000ZUpdatedAt20250826T225908000000ZId4UserId1UserNameIdNumber123477DeputizationContentITheUndersignedUserHerebyAuthorizeAndDeputizeSalvestPlatformNtoActOnMyBehalfInRelationToThePurchaseSaleAndTransferOfNrealEstatePropertiesThroughThePlatformNNThisAuthorizationGrantsThePlatformFullPowerToRepresentMeInCarryingNoutAllNecessaryLegalContractualAndAdministrativeProceduresRequiredNforCompletingTransactionsIncludingButNotLimitedToSigningContractsNsubmittingOrReceivingRelatedDocumentsAndFulfillingObligationsNtowardsThirdPartiesWithoutTheNeedForMyPhysicalPresenceNNThisDeputizationIsGivenInOrderToFacilitateTheInvestmentProcessNstreamlinePropertyTransactionsAndEnsureComplianceWithApplicableNlawsAndRegulationsDeputizationImageNullStatusProcessedCreatedAt20250823T063117000000ZUpdatedAt20250826T225852000000ZId5UserId1UserNameIdNumber123477DeputizationContentITheUndersignedUserHerebyAuthorizeAndDeputizeSalvestPlatformNtoActOnMyBehalfInRelationToThePurchaseSaleAndTransferOfNrealEstatePropertiesThroughThePlatformNNThisAuthorizationGrantsThePlatformFullPowerToRepresentMeInCarryingNoutAllNecessaryLegalContractualAndAdministrativeProceduresRequiredNforCompletingTransactionsIncludingButNotLimitedToSigningContractsNsubmittingOrReceivingRelatedDocumentsAndFulfillingObligationsNtowardsThirdPartiesWithoutTheNeedForMyPhysicalPresenceNNThisDeputizationIsGivenInOrderToFacilitateTheInvestmentProcessNstreamlinePropertyTransactionsAndEnsureComplianceWithApplicableNlawsAndRegulationsDeputizationImageNullStatusProcessedCreatedAt20250823T063628000000ZUpdatedAt20250826T230114000000ZId6UserId1UserNameIdNumber55555DeputizationContentITheUndersignedUserHerebyAuthorizeAndDeputizeSalvestPlatformNtoActOnMyBehalfInRelationToThePurchaseSaleAndTransferOfNrealEstatePropertiesThroughThePlatformNNThisAuthorizationGrantsThePlatformFullPowerToRepresentMeInCarryingNoutAllNecessaryLegalContractualAndAdministrativeProceduresRequiredNforCompletingTransactionsIncludingButNotLimitedToSigningContractsNsubmittingOrReceivingRelatedDocumentsAndFulfillingObligationsNtowardsThirdPartiesWithoutTheNeedForMyPhysicalPresenceNNThisDeputizationIsGivenInOrderToFacilitateTheInvestmentProcessNstreamlinePropertyTransactionsAndEnsureComplianceWithApplicableNlawsAndRegulationsDeputizationImageNullStatusProcessedCreatedAt20250823T063935000000ZUpdatedAt20250826T230127000000ZPaginationCurrentPage1LastPage2PerPage6Total8NextPageUrlHttp1270018000ApiV1GetAllDeputizationsForUserPage2PrevPageUrlNull(helperResponse.fullBody!);
        return deputizationResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
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