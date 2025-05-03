import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';

abstract class WalletServicesRepo {
  Future chargeWallet(ChargeInvestmentWalletEvent event);
  Future getWalletBalance(GetWalletBalanceEvent event);
  Future invest(InvestEvent event);
}
