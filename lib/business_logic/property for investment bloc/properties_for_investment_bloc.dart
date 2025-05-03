import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/data/models/get_proprties_for_investment_response/get_proprties_for_investment_response.dart';

import 'package:salvest_app/data/services/property%20service/sale_property_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'properties_for_investment_event.dart';
part 'properties_for_investment_state.dart';

class PropertiesForInvestmentBloc
    extends Bloc<PropertiesForInvestmentEvent, PropertiesForInvestmentState> {
  final SalePropertyRepoImpl salePropertyRepoImpl;
  PropertiesForInvestmentBloc(this.salePropertyRepoImpl)
    : super(PropertiesForInvestmentInitial()) {
    on<GetPropertiesForInvestmentsEvent>((event, emit) async {
      emit(PropertiesForInvestmentLoading());
      final response = await salePropertyRepoImpl.getPropertiesForInvestment(event);
      if (response is GetProprtiesForInvestmentResponse) {
        emit(
          PropertiesForInvestmentSuccess(
            getPropertiesForInvestmentResponse: response,
          ),
        );
      }
      else {
        emit(PropertiesForInvestmentFailure(helperResponse: response));
      }
    });
  }
}
