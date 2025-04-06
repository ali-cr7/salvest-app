import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/auto%20investment/widgets/auto_investment_view_body.dart';
import 'package:salvest_app/presentation/auto%20investment/widgets/toggle_switch.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/custom_button.dart';

class AutoInvestmentView extends StatelessWidget {
  const AutoInvestmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Auto Investing',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ToggleSwitchWidget(),
          ),
          SizedBox(height: 12),
          Center(
            child: Container(
              width: 334,
              height: 259,
              decoration: ShapeDecoration(
                color: const Color(0x7FE8E8E8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: AutoInvestmentViewBody(),
            ),
          ),
          Expanded(child: SizedBox()),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomSendButton(buttonName: 'applay', onTap: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
