import 'package:salvest_app/business_logic/deputizations%20bloc/deputizations_bloc.dart';
import 'package:salvest_app/business_logic/investing%20history%20bloc/inveseting_history_bloc.dart';
import 'package:salvest_app/business_logic/send%20api%20withdraw%20bloc/send_api_withdraw_money_bloc_bloc.dart';
import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';
import 'package:salvest_app/business_logic/withdrawls%20request%20bloc/withdrawls_request_bloc.dart';

abstract class WalletServicesRepo {
  Future chargeWallet(ChargeInvestmentWalletEvent event);
  Future getWalletBalance(GetWalletBalanceEvent event);
  Future invest(InvestEvent event);
  Future createDeputizations(CreateDeputizationsEvent event);
  Future getAllDeputizationsForUser();
  Future getMyInvestingHistory(InvesetingHistoryEvent event, int page);
  Future getWalletPercentage(GetWalletPercentageEvent event);
  Future transferToInvestment(TransferToInvestmentWalletEvent event);
  Future withDrawMoney(WithdrawMoneyApiEvent event);
  Future getWithdrawlsRequests(GetWithdrawlsRequest event);
}
