import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/data/models/get_user_properties_owner_ship_resposne/get_user_properties_owner_ship_resposne.dart';
import 'package:salvest_app/data/services/property%20service/sale_property_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'get_user_properties_owner_ship_e_event.dart';
part 'get_user_properties_owner_ship_e_state.dart';

class GetUserPropertiesOwnerShipEBloc
    extends
        Bloc<
          GetUserPropertiesOwnerShipEEvent,
          GetUserPropertiesOwnerShipEState
        > {
  final SalePropertyRepoImpl salePropertyRepoImpl;
  GetUserPropertiesOwnerShipEBloc(this.salePropertyRepoImpl)
    : super(GetUserPropertiesOwnerShipEInitial()) {
      
    on<GetOwneredProprtiesEvent>((event, emit) async {
      emit(GetUserPropertiesOwnerShipLoading());
      final response = await salePropertyRepoImpl.getProperiesOwnerShip(event);
      if (response is GetUserPropertiesOwnerShipResposne) {
        emit(
          GetUserPropertiesOwnerShipSuccess(
            getUserPropertiesOwnerShipResposne: response,
          ),
        );
      } else {
        emit(GetUserPropertiesOwnerShipFailure(helperResponse: response));
      }
    });

    on<TransferOwneredProprties>((event, emit) async {
      emit(TransferPropertiesOwnerShipLoading());
      final response = await salePropertyRepoImpl.transferOwnenrShip(event);
      if (response is String) {
        emit(TransferPropertiesOwnerShipSuccess(message: response));
      } else {
        emit(TransferPropertiesOwnerShipFailure(helperResponse: response));
      }
    });
  }
}
