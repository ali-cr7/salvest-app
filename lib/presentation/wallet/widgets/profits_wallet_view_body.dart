import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_card.dart'
    show WalletCard;
import 'package:salvest_app/presentation/wallet/widgets/wallet_listview_item.dart'
    show WalletListViewItem;
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
            Center(
              child: WalletCard(
                arrowIconData: Icons.arrow_back_ios,
                walletValue: '19,000.08',
                arrowCallback: () {
                  GoRouter.of(context).push(AppRouter.kWalitView);
                },
                cardColr: AppColors.greenGradient.withOpacity(0.65),
                cardIcon: AppAssets.cashGreenSvg,
                cardStrting: 'Profits wallet',
              ),
            ),
            SizedBox(height: 55),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 4),
              child: Text('Profits'),
            ),
            Center(
              child: Container(width: 365, height: 4, color: Color(0x70088711)),
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
                      itemColor: const Color(0x477AF383),
                      date:
                          'your investment in Tartous Chalet has been received to 8 Nov 2023.',
                      iconAsset: AppAssets.cashGreen,
                      mainText: '50 of investment has been received!',
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
