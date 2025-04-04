import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:salvest_app/presentation/wallet/widgets/wallet_button.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_card.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_listview_item.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WalletCard(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: const Divider(
                thickness: 4,
                color: Color(0xFF9A8AEC),
                indent: 40,
              ),
            ),
            // 0xA09A8AEC
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 12,
                    ),
                    child: WalletListViewItem(),
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
