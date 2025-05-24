import 'package:salvest_app/business_logic/investing%20history%20bloc/inveseting_history_bloc.dart';
import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';

abstract class WalletServicesRepo {
  Future chargeWallet(ChargeInvestmentWalletEvent event);
  Future getWalletBalance(GetWalletBalanceEvent event);
  Future invest(InvestEvent event);
  Future getMyInvestingHistory(InvesetingHistoryEvent event,int page);
  
    Future getWalletPercentage(GetWalletPercentageEvent event);
  
}
  