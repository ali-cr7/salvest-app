import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_card.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_listview_item.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_view.body.dart';

import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/dialogs_snackBar.dart';
import 'package:salvest_app/utility/router.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletBloc, WalletState>(
      listener: (context, state) {
        if (state is WalletChargeLoading) {
          EasyLoading.show(status: 'loading...');
        }
        if (state is WalletChargeSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('✅ ${state.message}')));
        }

        if (state is WalletChargeFailure) {
          DialogsWidgetsSnackBar.showSnackBarFromStatus(
            context: context,
            helperResponse: state.helperResponse,
            showServerError: true,
          );
        }
      },
      child: Scaffold(
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
        body: WalletViewBody(),
      ),
    );
  }
}
