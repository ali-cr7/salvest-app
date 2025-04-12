import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/portfolio/widgets/double_line_chart.dart'
    show DoubleLineChartCard;
import 'package:salvest_app/presentation/portfolio/widgets/investments_of_wallets.dart';
import 'package:salvest_app/presentation/portfolio/widgets/protfolio_button.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

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
          'Portfolio',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          InvestmentsOfWallet(),
          SizedBox(height: 20),
          DoubleLineChartCard(),
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 365,
              height: 4,
              color: Color(0xFF9A8AEC).withAlpha(140),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 26.0),
            child: ProtfolioButtons(),
          ),
        ],
      ),
    );
  }
}
