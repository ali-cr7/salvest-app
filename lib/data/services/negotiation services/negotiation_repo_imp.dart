import 'package:salvest_app/business_logic/expert%20negotiation%20bloc/expert_negotiation_bloc.dart';
import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/expert_negotiation_response/expert_negotiation_response.dart';
import 'package:salvest_app/data/services/negotiation%20services/negotiation_repo.dart';
import 'package:salvest_app/utility/api_config/api_config.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'package:salvest_app/utility/enums.dart';

class NegotiationRepoImp implements NegotiationRepo {
  final ApiService _apiService;

  NegotiationRepoImp(this._apiService);

  @override
  Future getNegotiationBox(GetExpertNegotiationEvent event) async {
    HelperResponse helperResponse = await _apiService.get(
      token: token,
      endpoint: APIConfig.getAgreedNegotiation,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        ExpertNegotiationResponse expertNegotiationResponse =
            ExpertNegotiationResponse.from(helperResponse.fullBody!);
        print('Full response: ${helperResponse.fullBody}');
        print(expertNegotiationResponse);

        print(expertNegotiationResponse.message);

        return expertNegotiationResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }

  @override
  Future acceptNegotiationBox(AcceptExpertNegotiationEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.acceptNegotiation + event.id,
      token: token,
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
  Future rejectNegotiationBox(RejectExpertNegotiationEvent event) async {
      HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.rejecttNegotiation + event.id,
      token: token,
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
  }
}
