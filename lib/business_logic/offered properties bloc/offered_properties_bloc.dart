import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/data/models/get_offered_proprties_response/get_offered_proprties_response.dart';
import 'package:salvest_app/data/services/property%20service/sale_property_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'offered_properties_event.dart';
part 'offered_properties_state.dart';

class OfferedPropertiesBloc
    extends Bloc<OfferedPropertiesEvent, OfferedPropertiesState> {
  final SalePropertyRepoImpl salePropertyRepoImpl;
  OfferedPropertiesBloc(this.salePropertyRepoImpl)
    : super(OfferedPropertiesInitial()) {
    on<GetOfferedPropertiesEvent>((event, emit) async {
      emit(OfferedPropertiesLoading());
      final response = await salePropertyRepoImpl.getOfferdProperties(event);
      if (response is GetOfferedProprtiesResponse) {
        emit(OfferedPropertiesSuccess(getOfferedProprtiesResponse: response));
      } else {
        emit(OfferedPropertiesFailure(helperResponse: response));
      }
    });
  }
}
