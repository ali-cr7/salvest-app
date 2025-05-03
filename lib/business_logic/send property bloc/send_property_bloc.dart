import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/business_logic/sale%20property%20bloc/sale_property_bloc.dart';
import 'package:salvest_app/data/services/property%20service/sale_property_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'send_property_event.dart';
part 'send_property_state.dart';

class SendPropertyBloc extends Bloc<SendPropertyEvent, SendPropertyState> {
  final SalePropertyRepoImpl salePropertyRepoImpl;
  SendPropertyBloc(this.salePropertyRepoImpl) : super(SendPropertyInitial()) {
    on<SendPropertyApiEvent>((event, emit) async {
      emit(SendPropertyLoading());
      print('Rebuilding with stat');
      print(event.salePropertyState);
      final response = await salePropertyRepoImpl.saleProperty(event);
      emit(SendPropertyStatus(helperResponse: response));
    });
  }
}
