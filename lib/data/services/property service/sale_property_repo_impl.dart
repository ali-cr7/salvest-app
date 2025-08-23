import 'package:dio/dio.dart';
import 'package:salvest_app/business_logic/acivate%20investment%20settings%20bloc/activate_auto_ivnestment_bloc.dart';
import 'package:salvest_app/business_logic/get%20suer%20properties%20owner%20ship%20bloc/get_user_properties_owner_ship_e_bloc.dart';
import 'package:salvest_app/business_logic/offered%20properties%20bloc/offered_properties_bloc.dart';
import 'package:salvest_app/business_logic/property%20for%20investment%20bloc/properties_for_investment_bloc.dart';
import 'package:salvest_app/business_logic/send%20property%20bloc/send_property_bloc.dart';

import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/get_offered_proprties_response/get_offered_proprties_response.dart';
import 'package:salvest_app/data/models/get_proprties_for_investment_response/get_proprties_for_investment_response.dart';
import 'package:salvest_app/data/models/get_user_properties_owner_ship_resposne/get_user_properties_owner_ship_resposne.dart';

import 'package:salvest_app/data/services/property%20service/sale_property_repo.dart';

import 'package:salvest_app/utility/api_config/api_config.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'package:salvest_app/utility/enums.dart';

class SalePropertyRepoImpl implements SalePropertyRepo {
  final ApiService _apiService;
  static const _timeout = Duration(seconds: 30);
  SalePropertyRepoImpl(this._apiService);

  @override
  Future<HelperResponse> saleProperty(SendPropertyApiEvent event) async {
    try {
      final formData = await event.salePropertyState.toFormData();
      HelperResponse helperResponse = await _apiService.post(
        endpoint: APIConfig.sendPropertyForSale,
        data: formData,
        token: token,
      );

      return helperResponse;
    } catch (e) {
      // Handle any unexpected errors during form data conversion
      return HelperResponse(
        fullBody: {'error': 'Failed to prepare request: ${e.toString()}'},
        response: 'Failed to prepare property data',
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    }
  }

  @override
  Future getOfferdProperties(GetOfferedPropertiesEvent event) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: APIConfig.getOfferedProperties,
      token: token,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        GetOfferedProprtiesResponse getOfferedProprtiesResponse =
            GetOfferedProprtiesResponse.from(helperResponse.fullBody!);
        return getOfferedProprtiesResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }

  @override
  Future getPropertiesForInvestment(
    GetPropertiesForInvestmentsEvent event,
  ) async {
    print("heeeet is token $token");
    if (token == '') {
      print('1'); 
      HelperResponse helperResponse = await _apiService.post(
        endpoint: APIConfig.getPrpertyForInvestments,
        
        data: {'property_type': event.propertyType},
      );
      if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
        try {
          GetProprtiesForInvestmentResponse getPropertiesForInvestmentResponse =
              GetProprtiesForInvestmentResponse.from(helperResponse.fullBody!);
          return getPropertiesForInvestmentResponse;
        } catch (e) {
          return helperResponse.copyWith(
            servicesResponse: ServicesResponseStatues.modelError,
          );
        }
      }
    } else {
      print('2');
      HelperResponse helperResponse = await _apiService.post(
        endpoint: APIConfig.getPrpertyForInvestments,
token: token,
        data: {'property_type': event.propertyType},
      );
      if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
        try {
          GetProprtiesForInvestmentResponse getPropertiesForInvestmentResponse =
              GetProprtiesForInvestmentResponse.from(helperResponse.fullBody!);
          return getPropertiesForInvestmentResponse;
        } catch (e) {
          return helperResponse.copyWith(
            servicesResponse: ServicesResponseStatues.modelError,
          );
        }
      }
    }
  }

  @override
  Future activateAutoInvestment(ActicvateAutoInvestmentApiEvent event) async {
    try {
      final formData = await event.autoInvestmentSettingsState.toFormData();
      HelperResponse helperResponse = await _apiService.post(
        endpoint: APIConfig.activateAutoInvestment,
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

  @override
  Future deActivateAutoInvestment(
    DeActicvateAutoInvestmentApiEvent event,
  ) async {
    try {
      HelperResponse helperResponse = await _apiService.post(
        endpoint: APIConfig.deactivateAutoInvestment,

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

  @override
  Future getProperiesOwnerShip(GetOwneredProprtiesEvent event) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: APIConfig.getOwneredProprties,
      token: token,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        GetUserPropertiesOwnerShipResposne getUserPropertiesOwnerShipResposne =
            GetUserPropertiesOwnerShipResposne.from(helperResponse.fullBody!);
        return getUserPropertiesOwnerShipResposne;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }

  @override
  Future transferOwnenrShip(TransferOwneredProprties event) async {
    try {
      HelperResponse helperResponse = await _apiService.post(
        endpoint: APIConfig.transferOwnership,
        data: {
          'new_user_id': event.newUserId,
          'certificate_id': event.certificateId,
        },
        token: token,
      );
      final String message = helperResponse.fullBody!['message'];
      print("ownership reposne ${helperResponse.fullBody}");

      return message;
    } catch (e) {
      return HelperResponse(
        fullBody: {'error': 'Failed to prepare request: ${e.toString()}'},
        response: 'Failed to prepare property data',
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    }
  }
}
