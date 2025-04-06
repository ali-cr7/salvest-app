import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:salvest_app/presentation/wallet/widgets/profits_wallet_view_body.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_card.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_listview_item.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_view.body.dart';

import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/router.dart';

class ProfitWalletView extends StatelessWidget {
  const ProfitWalletView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kHomePageView);
          },
        ),
        title: const Text(
          'Wallet',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ProfitWalletViewBody(),
    );
  }
}
