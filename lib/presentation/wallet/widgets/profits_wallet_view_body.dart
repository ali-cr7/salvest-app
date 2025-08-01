import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';
import 'package:salvest_app/presentation/wallet/widgets/profits_history_list.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_card.dart'
    show WalletCard;
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/router.dart';

class ProfitWalletViewBody extends StatelessWidget {
  const ProfitWalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<WalletBloc, WalletState>(
              builder: (context, state) {
                if (state is GetWalletBalanceLoading) {
                  return Center(
                    child: WalletCard(
                      isLoading: true,
                      rfreshCallback: () {
                        context.read<WalletBloc>().add(
                          GetProfitsWalletBalanceEvent(),
                        );
                      },
                      deposite: () {},
                      arrowIconData: Icons.arrow_back_ios,
                      walletValue: '',
                      arrowCallback: () {
                        GoRouter.of(context).push(AppRouter.kWalitView);
                      },
                      cardColr: AppColors.greenGradient.withOpacity(0.65),
                      cardIcon: AppAssets.cashGreenSvg,
                      cardStrting: 'Profits wallet',
                    ),
                  );
                } else if (state is GetWalletBalanceSuccess) {
                  return Center(
                    child: WalletCard(
                      isLoading: false,
                      rfreshCallback: () {
                        context.read<WalletBloc>().add(
                          GetProfitsWalletBalanceEvent(),
                        );
                      },
                      deposite: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            TextEditingController amountController =
                                TextEditingController();
                            return BlocListener<WalletBloc, WalletState>(
                              listener: (context, state) {
                                if (state is TransferToInvestmentLoading) {
                                  EasyLoading.show(status: 'loading...');
                                }
                                if (state is TransferToInvestmentSuccess) {
                                  EasyLoading.dismiss();
                                  context.read<WalletBloc>().add(
                                    GetProfitsWalletBalanceEvent(),
                                  );
                                  EasyLoading.showInfo(state.message);
                                  Navigator.pop(context);
                                }
                                if (state is TransferToInvestmentFailure) {
                                  EasyLoading.dismiss();
                                  context.read<WalletBloc>().add(
                                    GetProfitsWalletBalanceEvent(),
                                  );
                                  EasyLoading.showError(
                                    state.helperResponse.fullBody!['message'],
                                  );
                                }
                              },
                              child: AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                backgroundColor: Colors.white,
                                title: const Text(
                                  'Transfer to Investment Wallet',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                content: TextField(
                                  controller: amountController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'Amount',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.attach_money),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.green15,
                                    ),
                                    onPressed: () {
                                      final amount =
                                          amountController.text.trim();
                                      if (amount.isNotEmpty) {
                                        context.read<WalletBloc>().add(
                                          TransferToInvestmentWalletEvent(
                                            amount: amount,
                                          ),
                                        );
                                        print('Transfer Amount: $amount');
                                        //
                                      }
                                    },
                                    child: const Text('Submit'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },

                      arrowIconData: Icons.arrow_back_ios,
                      walletValue: state.response.data![0].balance.toString(),
                      arrowCallback: () {
                        GoRouter.of(context).push(AppRouter.kWalitView);
                      },
                      withdraw: () {
                        
                        GoRouter.of(context).push(AppRouter.kWithdrawalMoneyView);
                      },
                      cardColr: AppColors.greenGradient.withOpacity(0.65),
                      cardIcon: AppAssets.cashGreenSvg,
                      cardStrting: 'Profits wallet',
                    ),
                  );
                } else if (state is GetWalletBalanceFailure) {
                  return Center(
                    child: WalletCard(
                      isLoading: false,
                      rfreshCallback: () {
                        context.read<WalletBloc>().add(
                          GetProfitsWalletBalanceEvent(),
                        );
                      },
                      deposite: () {
                        //     print("object")
                      },
                      arrowIconData: Icons.arrow_back_ios,
                      walletValue: 'faild to download',
                      arrowCallback: () {
                        GoRouter.of(context).push(AppRouter.kWalitView);
                      },
                      cardColr: AppColors.greenGradient.withOpacity(0.65),
                      cardIcon: AppAssets.cashGreenSvg,
                      cardStrting: 'Profits wallet',
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            SizedBox(height: 55),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 4),
              child: Text('Profits'),
            ),
            Center(
              child: Container(width: 365, height: 4, color: Color(0x70088711)),
            ),

            Expanded(child: ProfitsHistoryList()),
          ],
        ),
      ),
    );
  }
}
