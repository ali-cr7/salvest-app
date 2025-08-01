import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/business_logic/withdraw%20money%20bloc/withdraw_money_bloc.dart';
import 'package:salvest_app/data/services/wallet%20services/wallet_services_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'send_api_withdraw_money_bloc_event.dart';
part 'send_api_withdraw_money_bloc_state.dart';

class SendApiWithdrawMoneyBlocBloc
    extends Bloc<SendApiWithdrawMoneyBlocEvent, SendApiWithdrawMoneyBlocState> {
  final WalletServicesRepoImpl walletServicesRepoImpl;
  SendApiWithdrawMoneyBlocBloc(this.walletServicesRepoImpl)
    : super(SendApiWithdrawMoneyBlocInitial()) {
    on<WithdrawMoneyApiEvent>((event, emit) async {
      emit(SendApiWithdrawMoneyLoading());
      final response = await walletServicesRepoImpl.withDrawMoney(event);
      emit(SendApiWithdrawMoneyStatus(helperResponse: response));
    });
  }
}
  