import 'package:salvest_app/business_logic/help%20bloc/help_bloc.dart';
import 'package:salvest_app/data/models/faq_respone/faq_respone.dart';
import 'package:salvest_app/data/services/help%20services/help_repo.dart';
import 'package:salvest_app/utility/api_config/api_config.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'package:salvest_app/utility/enums.dart';

class HelpRepoImpl implements HelpRepo {
  final ApiService _apiService;

  HelpRepoImpl(this._apiService);
  @override
  Future getFqm(GetFqmEvent event) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: APIConfig.getCommonQuestions,
    
    );
     if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        FaqRespone faqRespone = FaqRespone.from(
          helperResponse.fullBody!,
        );
        print('Full response: ${helperResponse.fullBody}');
        print(faqRespone);
     
        print(faqRespone.message);
       
        return faqRespone;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }
}
