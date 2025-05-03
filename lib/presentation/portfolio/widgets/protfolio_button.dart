import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/portfolio/widgets/protfolio_item.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/router.dart';

class ProtfolioButtons extends StatelessWidget {
  const ProtfolioButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 25,
          children: [
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kCapitalGrowthView);
              },
              child: ProtfolioItem(
                gradient: LinearGradient(
                  begin: Alignment(0.04, 1.00),
                  end: Alignment(1.00, 0.00),
                  colors: [
                    const Color(0xFF8CE996),
                    const Color(0xFF6DB675),
                    const Color(0xFF4E8354),
                  ],
                ).withOpacity(0.6),
                //AppColors.greenGradient.withOpacity(0.6),
                icon: AppAssets.cashGreen,
                text: 'Capital Growth',
              ),
            ),
            ProtfolioItem(
              gradient: AppColors.yellowGradient.withOpacity(0.6),
              icon: AppAssets.balanceIcon,
              text: 'Balanced',
            ),
          ],
        ),
        SizedBox(height: 20),
        ProtfolioItem(
          gradient: LinearGradient(
            begin: Alignment(-0.00, 1.00),
            end: Alignment(1.00, -0.00),
            colors: [
              const Color(0xFFC0B4FF),
              const Color(0xFF9990CC),
              const Color(0xFF736C99),
            ],
          ).withOpacity(0.6),

          //AppColors.blueGradient.withOpacity(0.6),
          icon: AppAssets.highIncome,
          text: 'High Incoming',
        ),
      ],
    );
  }
}
