import 'package:dio/dio.dart';
import 'package:salvest_app/business_logic/offered%20properties%20bloc/offered_properties_bloc.dart';
import 'package:salvest_app/business_logic/property%20for%20investment%20bloc/properties_for_investment_bloc.dart';
import 'package:salvest_app/business_logic/send%20property%20bloc/send_property_bloc.dart';

import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/get_offered_proprties_response/get_offered_proprties_response.dart';
import 'package:salvest_app/data/models/get_proprties_for_investment_response/get_proprties_for_investment_response.dart';

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
      print("alllllllllllllll");
      print(formData.fields);

      return await _apiService.post(
        endpoint: APIConfig.sendPropertyForSale,
        data: formData,
        token: token,
      );
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
  Future getPropertiesForInvestment(GetPropertiesForInvestmentsEvent event) async {
     HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.getPrpertyForInvestments,
      token: token,
      data: {
        'property_type' : event.propertyType
      }
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
