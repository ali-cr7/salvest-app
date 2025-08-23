import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
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
  }
}
