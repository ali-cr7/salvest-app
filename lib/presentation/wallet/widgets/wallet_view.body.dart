import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_card.dart'
    show WalletCard;
import 'package:salvest_app/presentation/wallet/widgets/wallet_listview_item.dart'
    show WalletListViewItem;
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/router.dart';

class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: WalletCard(
                arrowIconData: Icons.arrow_forward_ios,
                walletValue: '25,456.12',
                arrowCallback: () {
                  GoRouter.of(context).push(AppRouter.kProfitWalletView);
                },
                cardColr: AppColors.purple2Gradient,
                cardIcon: AppAssets.investmentSvg,
                cardStrting: 'Investment wallet',
              ),
            ),
            SizedBox(height: 55),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 4),
              child: Text('investmet'),
            ),
            Center(
              child: Container(
                width: 365,
                height: 4,
                color: Color(0xFF9A8AEC).withAlpha(140),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 18,
                    ),
                    child: WalletListViewItem(
                      itemColor: Color(0x3F9A8AEC),
                      date: '7 April 2024',
                      iconAsset: AppAssets.investmentBlueSvg,
                      mainText: '70 invested in Kaseon Mole ',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
