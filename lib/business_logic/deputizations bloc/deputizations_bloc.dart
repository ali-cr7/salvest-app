import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/data/models/get_deputaiztion_for_user_response/get_deputaiztion_for_user_response.dart';
import 'package:salvest_app/data/services/wallet%20services/wallet_services_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'deputizations_event.dart';
part 'deputizations_state.dart';

class DeputizationsBloc extends Bloc<DeputizationsEvent, DeputizationsState> {
  final WalletServicesRepoImpl walletServicesRepoImpl;
  DeputizationsBloc(this.walletServicesRepoImpl)
    : super(DeputizationsInitial()) {
    on<CreateDeputizationsEvent>((event, emit) async {
      emit(CreateDeputizationsLoading());
      final response = await walletServicesRepoImpl.createDeputizations(event);
      if (response is String) {
        emit(CreateDeputizationsSuccess(message: response));
      } else {
        emit(CreateDeputizationsFailure(helperResponse: response));
      }
    });

    on<GetDeputizationsEvent>((event, emit) async {
      emit(GetDeputizationsLoading());
      final response = await walletServicesRepoImpl.getAllDeputizationsForUser();
      if (response is GetDeputaiztionForUserResponse) {
        emit(GetDeputizationsSuccess(deputizationsResponse: response));
      } else {
        emit(GetDeputizationsFailure(helperResponse: response));
      }
    });
  }
}
