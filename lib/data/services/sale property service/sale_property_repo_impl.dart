import 'package:dio/dio.dart';
import 'package:salvest_app/business_logic/send%20property%20bloc/send_property_bloc.dart';

import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/services/sale%20property%20service/sale_property_repo.dart';

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
}
