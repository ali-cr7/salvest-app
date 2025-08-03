import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/data/models/my_withdrawls_requests/my_withdrawls_requests.dart';
import 'package:salvest_app/data/models/my_withdrawls_requests/my_withdrawls_requests_reponse.dart';
import 'package:salvest_app/data/services/wallet%20services/wallet_services_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'withdrawls_request_event.dart';
part 'withdrawls_request_state.dart';

class WithdrawlsRequestBloc
    extends Bloc<WithdrawlsRequestEvent, WithdrawlsRequestState> {
  final WalletServicesRepoImpl walletServicesRepoImpl;
  WithdrawlsRequestBloc(this.walletServicesRepoImpl)
    : super(WithdrawlsRequestInitial()) {
    on<GetWithdrawlsRequest>((event, emit) async {
      emit(WithdrawlsRequestLoading());
      final resposne = await walletServicesRepoImpl.getWithdrawlsRequests(
        event,
      );
      print("the resposne ${resposne}");
      if (resposne is MyWithdrawlsRequestsReponse) {
        emit(WithdrawlsRequestSuccess(myWithdrawlsRequests: resposne));
      } else {
        emit(WithdrawlsRequestFailure(helperResponse: resposne));
      }
    });
  }
}
