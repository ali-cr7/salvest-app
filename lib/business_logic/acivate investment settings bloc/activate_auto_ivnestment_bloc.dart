import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/business_logic/auto%20investment%20settings%20bloc/auto_investment_settings_bloc.dart';
import 'package:salvest_app/data/services/property%20service/sale_property_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'activate_auto_ivnestment_event.dart';
part 'activate_auto_ivnestment_state.dart';

class ActivateAutoIvnestmentBloc
    extends Bloc<ActivateAutoIvnestmentEvent, ActivateAutoIvnestmentState> {
  final SalePropertyRepoImpl salePropertyRepoImpl;
  ActivateAutoIvnestmentBloc(this.salePropertyRepoImpl)
    : super(ActivateAutoIvnestmentInitial()) {
    on<ActicvateAutoInvestmentApiEvent>((event, emit) async {
      emit(ActivateAutoIvnestmentLoading());
      final response = await salePropertyRepoImpl.activateAutoInvestment(event);
      emit(ActicvateAutoInvestmentStatus(helperResponse: response));
    });

    on<DeActicvateAutoInvestmentApiEvent>((event, emit) async {
      emit(ActivateAutoIvnestmentLoading());
      final response = await salePropertyRepoImpl.deActivateAutoInvestment(
        event,
      );
      emit(ActicvateAutoInvestmentStatus(helperResponse: response));
    });
  }
}
